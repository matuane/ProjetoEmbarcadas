#include "centralDesarmada.h"
#include <pic18f4520.h>
#include "bits.h"
#include "io.h"
#include "config.h"
#include "delay.h"
#include "buzzer.h"
#include "printf.h"
#include "lcd.h"


void centralDesarmada(){
    //Declaração das variaveis
    int i;
    unsigned char j;
    
    //Configura as entradas
    TRISD = 0x00;
    TRISA = 0x00;
    //configuração do sistema
    bitClr(INTCON2, 7); //liga pull up 
    ADCON1 = 0x0E; //config AD
    TRISB = 0xFD; //config da porta B 
    PORTB = 0x00; //config da porta B 
    
    //Desliga o display de set segmentos
    bitClr(PORTA, 5);
    bitClr(PORTA, 4);
    bitClr(PORTA, 3);
    bitClr(PORTA, 2);
    
    //printa no LCD
    mensagemDesarmada();
   
    
    //Buzzer
    buzzerDesarmada();
    
    for(j = 0; j< 1; j++){
        PORTD = 0xff;
        delay(1000);

        PORTD = 0x00;
        delay(1000);
    }
    
    //Controla o display de 7 segmentos
    for(j = 0; j< 100; j++){
        bitClr(PORTA, 4);
        bitClr(PORTA, 3);
        bitSet(PORTA, 2);
        PORTD = 0x3f;
        delay(10);
        
        bitClr(PORTA, 2);
        bitSet(PORTA, 3);
        bitSet(PORTA, 4);
        PORTD = 0x71;
        delay(10);
    }
    
    bitClr(PORTA, 4);
    bitClr(PORTA, 3);
    bitClr(PORTA, 2);
    
    //Delay
    for(i=0; i< 1000; i++){
        for(j = 0; j< 100; j++);
    }
    lcdCommand(0x01);//Limpa o LCD
    //Desliga Heater
    PORTCbits.RC5 = 0;
}
