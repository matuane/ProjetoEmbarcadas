# 1 "main.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 288 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\language_support.h" 1 3
# 2 "<built-in>" 2
# 1 "main.c" 2
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
# 1 "main.c" 2

# 1 "./pwm.h" 1
# 23 "./pwm.h"
 void pwmSet1(unsigned char porcento);
 void pwmSet2(unsigned char porcento);
 void pwmFrequency(unsigned int freq);
 void pwmInit(void);
# 2 "main.c" 2

# 1 "./cooler.h" 1
# 11 "./cooler.h"
void cooler();
# 3 "main.c" 2

# 1 "./expect.h" 1
# 11 "./expect.h"
void exceptDesarmado();
void exceptArmado();
# 4 "main.c" 2

# 1 "./Armada.h" 1
# 11 "./Armada.h"
void armada();
# 5 "main.c" 2

# 1 "./centralDesarmada.h" 1
# 11 "./centralDesarmada.h"
void centralDesarmada();
# 6 "main.c" 2

# 1 "./keypad.h" 1
# 23 "./keypad.h"
 unsigned int kpRead(void);
 void kpDebounce(void);
 void kpInit(void);
# 7 "main.c" 2

# 1 "./bits.h" 1
# 8 "main.c" 2

# 1 "./casaInvadida.h" 1


void casaInvadida();
# 9 "main.c" 2

# 1 "./delay.h" 1
# 11 "./delay.h"
void delay(int valor);
# 10 "main.c" 2


# 1 "./pic18f4520.h" 1
# 12 "main.c" 2

# 1 "./printf.h" 1
# 11 "./printf.h"
void mensagemInicial();
void mensagemDesarmada();
void mensagemArmada();
void mensagemInvadida();
# 13 "main.c" 2

# 1 "./lcd.h" 1
# 23 "./lcd.h"
 void lcdCommand(unsigned char cmd);
 void lcdData(unsigned char valor);
 void lcdInit(void);
# 14 "main.c" 2



void main(void) {

    int i, op = 0, x = 1;
    int cont = 0;
    unsigned int verifica, v;
    int valor = 0, ver =0, lc = 0;
    int ar = 0;


    for(;;){

        kpInit();


        if(lc == 0){
            mensagemInicial();
            lc = 1;
        }



            if(kpRead() != verifica){

                verifica = kpRead();

                if(((kpRead()) & (1<<(3)))){
                    if(ar != 1){
                        op = 1;
                        ar = 1;
                    }else{
                        op = 5;
                    }
                }

                if(((kpRead()) & (1<<(7)))){
                    if(ar == 1){
                        op = 2;
                        ar = 0;
                    }
                    else{
                        op = 4;
                    };
                }
                if(((kpRead()) & (1<<(11)))){
                    if(ar == 1){
                        op = 3;
                    }
                }
            }
             kpDebounce();

             switch(op){
                case 1:
                    lcdCommand(0x01);
                    armada();
                    cooler();
                    op = 0;
                    (*(volatile __near unsigned char*)0xFC1) = 0x00;
                    break;

                case 2:
                    centralDesarmada();
                    op = 0;
                    (*(volatile __near unsigned char*)0xFC1) = 0x00;
                    pwmSet1(0);
                    lc = 0;
                    break;
                case 3:
                    for( i = 0; i<20; i++){
                        casaInvadida();
                    }

                        (*(volatile __near unsigned char*)0xF82) = 0x00;

                        (*(volatile __near unsigned char*)0xF84) = 0x00;

                    centralDesarmada();
                    op = 0;
                    pwmSet1(0);
                    lc = 0;
                    break;
                case 4:
                    exceptDesarmado();
                    op = 0;
                    lc = 0;
                    break;
                case 5:
                    exceptArmado();
                    op = 0;
                    lc = 0;
                    break;
             }

        }
}
