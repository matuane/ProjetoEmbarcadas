# 1 "ledDisparado.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 288 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\language_support.h" 1 3
# 2 "<built-in>" 2
# 1 "ledDisparado.c" 2
# 1 "./ledDiparado.h" 1



void ledDisparado();
# 1 "ledDisparado.c" 2

# 1 "./delay.h" 1
# 11 "./delay.h"
void delay(int valor);
# 2 "ledDisparado.c" 2

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
# 3 "ledDisparado.c" 2

# 1 "./pic18f4520.h" 1
# 4 "ledDisparado.c" 2

# 1 "./bits.h" 1
# 5 "ledDisparado.c" 2


void ledDisparado(){
    (*(volatile __near unsigned char*)0xF95) = 0x00;
    (*(volatile __near unsigned char*)0xF92) = 0x00;

    (((*(volatile __near unsigned char*)0xFF1)) &= ~(1<<(7)));
    (*(volatile __near unsigned char*)0xFC1) = 0x0E;
    (*(volatile __near unsigned char*)0xF93) = 0xFD;
    (*(volatile __near unsigned char*)0xF81) = 0x00;


    unsigned char i;



        (*(volatile __near unsigned char*)0xF83) = 0xff;
        delay(300);

        (*(volatile __near unsigned char*)0xF83) = 0x00;
        delay(300);


        (((*(volatile __near unsigned char*)0xF80)) |= (1<<(5)));
        (((*(volatile __near unsigned char*)0xF80)) |= (1<<(4)));
        (((*(volatile __near unsigned char*)0xF80)) |= (1<<(3)));
        (((*(volatile __near unsigned char*)0xF80)) |= (1<<(2)));
        (*(volatile __near unsigned char*)0xF83) = 0x00;

        for(i = 0; i < 10; i++);
}
