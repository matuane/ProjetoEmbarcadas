#include "expect.h"
#include "lcd.h"
#include "bits.h"
#include "delay.h"


void exceptDesarmado(){
    int i;
    char mensage[20]= "Central ja desarmada";
    lcdInit();
    
    lcdCommand(0x01);//Limpa o LCD
    lcdCommand(0x85);
    for(i = 0; i<20; i++){
        if(i == 8){
            lcdCommand(0xC2);
        }
        lcdData(mensage[i]);
    }
    for(i = 0; i<5; i++){
        delay(500);
    }
    lcdCommand(0x01);//Limpa o LCD
    
}

void exceptArmado(){
    int i;
    char mensage[20]= "Central ja armada";
    lcdInit();
    
    lcdCommand(0x01);//Limpa o LCD
    lcdCommand(0x85);
    for(i = 0; i<20; i++){
        if(i == 8){
            lcdCommand(0xC4);
        }
        lcdData(mensage[i]);
    }
    for(i = 0; i<5; i++){
        delay(500);
    }
    lcdCommand(0x01);//Limpa o LCD
    
}