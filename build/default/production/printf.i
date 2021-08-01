# 1 "printf.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 288 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\language_support.h" 1 3
# 2 "<built-in>" 2
# 1 "printf.c" 2
# 1 "./printf.h" 1
# 11 "./printf.h"
void mensagemInicial();
void mensagemDesarmada();
void mensagemArmada();
void mensagemInvadida();
# 1 "printf.c" 2

# 1 "./lcd.h" 1
# 23 "./lcd.h"
 void lcdCommand(unsigned char cmd);
 void lcdData(unsigned char valor);
 void lcdInit(void);
# 2 "printf.c" 2

# 1 "./config.h" 1
# 26 "./config.h"
#pragma config OSC=HS
#pragma config FCMEN = OFF
#pragma config IESO = OFF
#pragma config PWRT = OFF
#pragma config BOREN = OFF
#pragma config BORV = 46
#pragma config WDT=OFF
#pragma config WDTPS = 1
#pragma config MCLRE=ON
#pragma config LPT1OSC = OFF
#pragma config PBADEN = ON
#pragma config CCP2MX = PORTC
#pragma config STVREN = OFF
#pragma config LVP=OFF
#pragma config XINST = OFF
#pragma config DEBUG = OFF

#pragma config CP0 = OFF
#pragma config CP1 = OFF
#pragma config CP2 = OFF
#pragma config CP3 = OFF
#pragma config CPB = OFF
#pragma config CPD = OFF

#pragma config WRT0 = OFF
#pragma config WRT1 = OFF
#pragma config WRT2 = OFF
#pragma config WRT3 = OFF
#pragma config WRTB = OFF
#pragma config WRTC = OFF
#pragma config WRTD = OFF

#pragma config EBTR0 = OFF
#pragma config EBTR1 = OFF
#pragma config EBTR2 = OFF
#pragma config EBTR3 = OFF
#pragma config EBTRB = OFF
# 3 "printf.c" 2

# 1 "./lcdPosition.h" 1



void lcdPosition(unsigned char coluna, unsigned char linha);
# 4 "printf.c" 2


void mensagemInicial(){

    int i;


     char msg[35] = "Alarme Digite: 1(Armar) 2(Desarmar)";


    lcdInit();


        lcdPosition(0, 0);
        for (i = 0; i < 35; i++) {
            lcdData(msg[i]);
        if(i==6){
            lcdCommand(0xC0);
        }
        if(i==14){
            lcdCommand(0x92);
        }
        if(i==23){
            lcdCommand(0xD2);
        }
    }
}

void mensagemDesarmada(){


    int i;
    char msg[18] = "Central Desarmada";



    lcdInit();


    lcdCommand(0x01);
    lcdPosition(5, 0);
    for(i =0; i<18; i++){
        lcdData(msg[i]);
        if(i == 7){
            lcdCommand(0xC4);
        }
    }
}

void mensagemArmada(){
    int i;
    char msg[14] = "Central Armada";


    lcdInit();


    lcdCommand(0x01);
    lcdPosition(4, 0);


    for(i=0;i<14;i++) {
        lcdData(msg[i]);
        if (i == 7) {
            lcdCommand(0xC4);
        }
    }
}

void mensagemInvadida(){


    int i;
    char msg[19] = "Residencia Invadida";


    lcdInit();


    lcdCommand(0xC3);


    for(i=0; i<19; i++){
        lcdData(msg[i]);
        if (i == 10) {
            lcdCommand(0x94);
        }
    }
}
