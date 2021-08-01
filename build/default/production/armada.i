# 1 "armada.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 288 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\language_support.h" 1 3
# 2 "<built-in>" 2
# 1 "armada.c" 2
# 1 "./Armada.h" 1
# 11 "./Armada.h"
void armada();
# 1 "armada.c" 2

# 1 "./bits.h" 1
# 2 "armada.c" 2

# 1 "./pic18f4520.h" 1
# 3 "armada.c" 2

# 1 "./keypad.h" 1
# 23 "./keypad.h"
 unsigned int kpRead(void);
 void kpDebounce(void);
 void kpInit(void);
# 4 "armada.c" 2

# 1 "./io.h" 1
# 12 "./io.h"
enum pin_label{
    PIN_A0,PIN_A1,PIN_A2,PIN_A3,PIN_A4,PIN_A5,PIN_A6,PIN_A7,
    PIN_B0,PIN_B1,PIN_B2,PIN_B3,PIN_B4,PIN_B5,PIN_B6,PIN_B7,
    PIN_C0,PIN_C1,PIN_C2,PIN_C3,PIN_C4,PIN_C5,PIN_C6,PIN_C7,
    PIN_D0,PIN_D1,PIN_D2,PIN_D3,PIN_D4,PIN_D5,PIN_D6,PIN_D7,
    PIN_E0,PIN_E1,PIN_E2,PIN_E3,PIN_E4,PIN_E5,PIN_E6,PIN_E7
};

void digitalWrite(int pin, int value);
int digitalRead(int pin);
void pinMode(int pin, int type);
# 5 "armada.c" 2

# 1 "./delay.h" 1
# 11 "./delay.h"
void delay(int valor);
# 6 "armada.c" 2

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
# 7 "armada.c" 2

# 1 "./buzzer.h" 1
# 11 "./buzzer.h"
void buzzerArmada();
void buzzerDesarmada();
void buzzerDisparada();
# 8 "armada.c" 2

# 1 "./printf.h" 1
# 11 "./printf.h"
void mensagemInicial();
void mensagemDesarmada();
void mensagemArmada();
void mensagemInvadida();
# 9 "armada.c" 2

# 1 "./lcd.h" 1
# 23 "./lcd.h"
 void lcdCommand(unsigned char cmd);
 void lcdData(unsigned char valor);
 void lcdInit(void);
# 10 "armada.c" 2




void armada(){

    unsigned char j, temp;
    int l;


    (*(volatile __near unsigned char*)0xF95) = 0x00;
    (*(volatile __near unsigned char*)0xF92) = 0x00;

    (((*(volatile __near unsigned char*)0xFF1)) &= ~(1<<(7)));
    (*(volatile __near unsigned char*)0xFC1) = 0x0E;
    (*(volatile __near unsigned char*)0xF93) = 0xFD;
    (*(volatile __near unsigned char*)0xF81) = 0x00;


    (((*(volatile __near unsigned char*)0xF80)) &= ~(1<<(5)));
    (((*(volatile __near unsigned char*)0xF80)) &= ~(1<<(4)));
    (((*(volatile __near unsigned char*)0xF80)) &= ~(1<<(3)));
    (((*(volatile __near unsigned char*)0xF80)) &= ~(1<<(2)));


    mensagemArmada();


    buzzerArmada();


    for(l=0; l< 5000; l++){
        for(j = 0; j< 100; j++);
    }


    for(l = 0; l < 4; l++){
        (*(volatile __near unsigned char*)0xF83) = 0xff;
        delay(100);

        (*(volatile __near unsigned char*)0xF83) = 0x00;
        delay(100);
    }

    (*(volatile __near unsigned char*)0xF83) = 0xff;
    delay(100);


    for(l = 0; l< 1000; l++){
        (((*(volatile __near unsigned char*)0xF80)) |= (1<<(4)));
        (*(volatile __near unsigned char*)0xF83) = 0x37;
        for(temp = 0; temp < 100; temp++);
        (((*(volatile __near unsigned char*)0xF80)) &= ~(1<<(4)));
        (((*(volatile __near unsigned char*)0xF80)) |= (1<<(3)));
        (*(volatile __near unsigned char*)0xF83) = 0x3f;
        for(temp = 0; temp < 100; temp++);
    }


    (((*(volatile __near unsigned char*)0xF80)) &= ~(1<<(5)));
    (((*(volatile __near unsigned char*)0xF80)) &= ~(1<<(4)));
    (((*(volatile __near unsigned char*)0xF80)) &= ~(1<<(3)));
    (((*(volatile __near unsigned char*)0xF80)) &= ~(1<<(2)));

    lcdCommand(0x01);
}
