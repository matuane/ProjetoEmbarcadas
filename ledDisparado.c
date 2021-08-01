#include "ledDiparado.h"
#include "delay.h"
#include "config.h"
#include "pic18f4520.h"
#include "bits.h"

void ledDisparado(){
    TRISD = 0x00;
    TRISA = 0x00;
    //configuração do sistema
    bitClr(INTCON2, 7); //liga pull up 
    ADCON1 = 0x0E; //config AD
    TRISB = 0xFD; //config da porta B 
    PORTB = 0x00; //config da porta B 
    
    
    unsigned char i;
    
        
        //Pisca os leds
        PORTD = 0xff;
        delay(300);

        PORTD = 0x00;
        delay(300);
        //Liga o display de sete Segmentos
            
        bitSet(PORTA, 5);  
        bitSet(PORTA, 4); 
        bitSet(PORTA, 3); 
        bitSet(PORTA, 2); 
        PORTD = 0x00;
        //delay
        for(i = 0; i < 10; i++);
}
