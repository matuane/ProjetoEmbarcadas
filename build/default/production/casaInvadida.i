# 1 "casaInvadida.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 288 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\language_support.h" 1 3
# 2 "<built-in>" 2
# 1 "casaInvadida.c" 2
# 1 "./casaInvadida.h" 1


void casaInvadida();
# 1 "casaInvadida.c" 2

# 1 "./bits.h" 1
# 2 "casaInvadida.c" 2

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
# 3 "casaInvadida.c" 2

# 1 "./keypad.h" 1
# 23 "./keypad.h"
 unsigned int kpRead(void);
 void kpDebounce(void);
 void kpInit(void);
# 4 "casaInvadida.c" 2

# 1 "./ledDiparado.h" 1



void ledDisparado();
# 5 "casaInvadida.c" 2

# 1 "./pic18f4520.h" 1
# 6 "casaInvadida.c" 2

# 1 "./printf.h" 1
# 11 "./printf.h"
void mensagemInicial();
void mensagemDesarmada();
void mensagemArmada();
void mensagemInvadida();
# 7 "casaInvadida.c" 2

# 1 "./buzzer.h" 1
# 11 "./buzzer.h"
void buzzerArmada();
void buzzerDesarmada();
void buzzerDisparada();
# 8 "casaInvadida.c" 2


void casaInvadida(){

    unsigned int verifica;
    int valor = 1;
    int i, j;
    unsigned char k;

    (*(volatile __near unsigned char*)0xF94) = 0x00;
    (*(volatile __near unsigned char*)0xF96) = 0x00;


    (*(volatile __near unsigned char*)0xF82) = 0x01;

    (*(volatile __near unsigned char*)0xF84) = 0x01;


    mensagemInvadida();


    buzzerDisparada();


    ledDisparado();
}
