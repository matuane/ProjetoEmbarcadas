#include "Armada.h"
#include "bits.h"
#include "pic18f4520.h"
#include "keypad.h"
#include "io.h"
#include "delay.h"
#include "config.h"
#include "buzzer.h"
#include "printf.h"
#include "lcd.h"



void armada(){
    //Declaração das variaveis
    unsigned char j, temp;
    int l;
    
    //configuração das entradas
    TRISD = 0x00;
    TRISA = 0x00;
    //configuração do sistema
    bitClr(INTCON2, 7); //liga pull up 
    ADCON1 = 0x0E; //config AD
    TRISB = 0xFD; //config da porta B 
    PORTB = 0x00; //config da porta B 
    
    //Desliga os displays de 7 Segmentos
    bitClr(PORTA, 5);
    bitClr(PORTA, 4);
    bitClr(PORTA, 3);
    bitClr(PORTA, 2);
    
    //
    mensagemArmada();
    
    //Buzzer
    buzzerArmada();
    
    //Delay 
    for(l=0; l< 5000; l++){
        for(j = 0; j< 100; j++);
    }
    
    //Pisca os Leds
    for(l = 0; l < 4; l++){
        PORTD = 0xff;
        delay(100);

        PORTD = 0x00;
        delay(100);
    }
    //Liga todos os leds
    PORTD = 0xff;
    delay(100);
    
    //Impressão da mensagem ON no display de set segmentos
    for(l = 0; l< 1000; l++){
        bitSet(PORTA,4);
        PORTD = 0x37;
        for(temp = 0; temp < 100; temp++);
        bitClr(PORTA, 4);
        bitSet(PORTA, 3);
        PORTD = 0x3f;
        for(temp = 0; temp < 100; temp++);
    }
    
    //Desliga o display de set segmentos
    bitClr(PORTA, 5);
    bitClr(PORTA, 4);
    bitClr(PORTA, 3);
    bitClr(PORTA, 2);
    
    lcdCommand(0x01);//Limpa o LCD
}
