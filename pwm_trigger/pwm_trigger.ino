
//----------------------------------------------------------------------------------------------------------------------
// Definitions

#define PWM_PERIOD          20000 /* PWM period in µs (50 Hz) */
#define PWM_IDLE            1000  /* PWM pulse width for inactive channel */
#define PWM_ACTIVE          1800  /* PWM pulse width for active channel */

#define LED_BLINK_ON_MS     10    /* LED blink ON duration */
#define LED_BLINK_OFF_MS    240   /* LED blink OFF duration */
#define LED_BLINK_IDLE_MS   750   /* Minimum wait between blinks */

#define SW_THRESHOLD_DOWN1  950   /* ~4.5V */
#define SW_THRESHOLD_DOWN2  600   /* ~3.0V */
#define SW_THRESHOLD_DOWN3  300   /* ~1.5V */

//----------------------------------------------------------------------------------------------------------------------
// Digispark ATtiny85 board
//
// - Five pins available: P0..P5 (P3,P4 used by USB, P3 has 1.5 kΩ pull-up)
// - Hardware PWM can be output on pins P0, P1 and P4
// - Analog input from P2 (A1), P3 (A3), P4 (A2) and P5 (A0).
// - Special care must be taken with P5 as it is also nRESET (better avoid using it).
// - All can be used for digital output, but P5 is high at 3V, instead of 5V.
// - Internal board LED is connected to P1 (P0 on older revisions of the board).

#define PWM1    0
#define PWM2    1
#define PWM3    4

#define LED     3   /* OpenDrain */

#define SWA     1   /* Analog input number (A1), not pin number (PB2) */

//----------------------------------------------------------------------------------------------------------------------

enum sw_state {
  SW_UP     = 0,  // Switch is not pressed
  SW_DOWN1  = 1,  // Switch pressed, channel 1 selected
  SW_DOWN2  = 2,  // Switch pressed, channel 2 selected
  SW_DOWN3  = 3,  // Switch pressed, channel 3 selected
} s_sw_state = SW_UP;

static void read_sw_state( );
static void generate_pwm_pulses( );
static void update_indicator_led( );

//----------------------------------------------------------------------------------------------------------------------

void setup( )
{
  // PWM outputs
  pinMode( PWM1, OUTPUT );
  pinMode( PWM2, OUTPUT );
  pinMode( PWM3, OUTPUT );

  // LED (open-drain)
  pinMode( LED, OUTPUT );
  digitalWrite( LED, 0 );
}

//----------------------------------------------------------------------------------------------------------------------

void loop( )
{
  // Remember start for calculating time spent in the loop
  unsigned long t0 = micros();

  // Generate PWM pulses on all channels
  generate_pwm_pulses( );

  // Update switch state with analog read from input connected to the push button (and resistance-based selector)
  read_sw_state( );

  // Run diagnostic LED state-machine
  update_indicator_led( );

  // Wait for the time remaining of the PWM period
  unsigned long t1 = micros();
  const unsigned elapsed = t1 - t0;

  delayMicroseconds( PWM_PERIOD - elapsed );
}

//----------------------------------------------------------------------------------------------------------------------

static
void generate_pwm_pulses( )
{
  // Start PWM pulse
  digitalWrite( PWM1, 1 );
  digitalWrite( PWM2, 1 );
  digitalWrite( PWM3, 1 );

  // Delay minimum pulse idle time
  delayMicroseconds( PWM_IDLE );

  // Stop pulse for all PWM except the active one, which needs a bit more time
  switch ( s_sw_state )
  {
  case SW_UP: // No channels active. End all pulses
          digitalWrite( PWM1, 0 );
          digitalWrite( PWM2, 0 );
          digitalWrite( PWM3, 0 );
          break;
  case SW_DOWN1: // Channel 1 active
          digitalWrite( PWM2, 0 );
          digitalWrite( PWM3, 0 );
          // Keep channel 1 pulse for the duration of an active pulse
          delayMicroseconds( PWM_ACTIVE - PWM_IDLE );
          digitalWrite( PWM1, 0 );
          break;
  case SW_DOWN2: // Channel 2 active
          digitalWrite( PWM1, 0 );
          digitalWrite( PWM3, 0 );
          // Keep channel 2 pulse for the duration of an active pulse
          delayMicroseconds( PWM_ACTIVE - PWM_IDLE );
          digitalWrite( PWM2, 0 );
          break;
  case SW_DOWN3: // Channel 3 active
          digitalWrite( PWM1, 0 );
          digitalWrite( PWM2, 0 );
          // Keep channel 3 pulse for the duration of an active pulse
          delayMicroseconds( PWM_ACTIVE - PWM_IDLE );
          digitalWrite( PWM3, 0 );
          break;
  }
}

//----------------------------------------------------------------------------------------------------------------------

static
void update_indicator_led( )
{
  static enum { S_INIT, S_IDLE, S_WAIT_BLINK_ON, S_WAIT_BLINK_OFF, S_WAIT_IDLE }
                    s_state;    // Current state
  static uint8_t    s_blinks;   // Number of blinks remaining
  static unsigned   s_started;  // State start timestamp

  unsigned now = millis();
  const unsigned elapsed = now - s_started;

  switch ( s_state )
  {
  case S_INIT:  // Init LED initial state
        digitalWrite( LED, 1 );       // open-drain configuration
        s_started = now;
        s_state = S_IDLE;
        break;
  case S_IDLE:  // Check if work to do
        if ( s_sw_state )
        { // Start blinking
          digitalWrite( LED, 0 );
          s_started = now;
          s_state = S_WAIT_BLINK_ON;
          s_blinks = s_sw_state - 1;  // number of blinks left after this
        }
        break;
  case S_WAIT_BLINK_ON:
        if ( elapsed >= LED_BLINK_ON_MS )
        { // Stop blinking
          digitalWrite( LED, 1 );
          s_started = now;
          s_state = S_WAIT_BLINK_OFF;
        }
        break;
  case S_WAIT_BLINK_OFF:
        if ( elapsed >= LED_BLINK_OFF_MS )
        {
          if ( s_blinks-- )
          { // Resume blinking if any left
            digitalWrite( LED, 0 );
            s_started = now;
            s_state = S_WAIT_BLINK_ON;
          }
          else
          { // nothing else to do
            s_started = now;
            s_state = S_WAIT_IDLE;
          }
        }
        break;
  case S_WAIT_IDLE:
        if ( elapsed >= LED_BLINK_IDLE_MS )
        {
            s_started = now;
            s_state = S_IDLE;
        }
        break;
  }
}

//----------------------------------------------------------------------------------------------------------------------

static
void read_sw_state( )
{
  // Read current value
  unsigned swa = analogRead( SWA );

  // Quantize result
  if ( swa > SW_THRESHOLD_DOWN1 )
    s_sw_state = SW_DOWN1;  // Button is down, channel 1 selected
  else if ( swa > SW_THRESHOLD_DOWN2 )
    s_sw_state = SW_DOWN2;  // Button is down, channel 2 selected
  else if ( swa > SW_THRESHOLD_DOWN3 )
    s_sw_state = SW_DOWN3;  // Button is down, channel 3 selected
  else
    s_sw_state = SW_UP;     // Very low value, button is up.
}

//----------------------------------------------------------------------------------------------------------------------
