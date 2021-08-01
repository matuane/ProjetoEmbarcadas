#include "buzzer.h"
#include "config.h"
#include <pic18f4520.h>
#include "pwm.h"
#include "delay.h"

void buzzerArmada(){
    //Buzzer
    int i;
    pwmInit();
    
    for(i = 0; i<2; i++){
        pwmFrequency(10000);
        pwmSet2(50);
        delay(300);
        pwmSet2(0);
        delay(300);
    }
}

void buzzerDesarmada(){
     //Buzzer
    int i;
    pwmInit();
    
    pwmFrequency(10000);
    pwmSet2(50);
    delay(400);
    pwmSet2(0);
}

void buzzerDisparada(){
     //Buzzer
    int i;
    pwmInit();
    
    pwmFrequency(10000);
    pwmSet2(50);
    delay(400);
    pwmSet2(0);
    delay(150);
}