#include "cooler.h"
#include <pic18f4520.h>
#include "config.h"
#include "pwm.h"

void cooler(){
    // Inicializacao
    ADCON1 = 0x06;
    TRISB = 0x01;
    TRISC = 0x00;
    TRISD = 0x00;
    TRISE = 0x00;
    TRISB = 0xF8;
    
    pwmInit();
    pwmSet1(96);
    PORTCbits.RC5 = 1;
}
