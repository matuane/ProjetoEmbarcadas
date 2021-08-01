#include "casaInvadida.h"
#include "bits.h"
#include "config.h"
#include "keypad.h"
#include "ledDiparado.h"
#include "pic18f4520.h"
#include "printf.h"
#include "buzzer.h"

void casaInvadida(){
    //Declaração das variaveis
    unsigned int verifica;
    int valor = 1;
    int i, j;
    unsigned char k;
    
    TRISC = 0x00;
    TRISE = 0x00;
    
     //liga relé 1
    PORTC = 0x01;
    //liga relé 2
    PORTE = 0x01;
    
    //LCD
    mensagemInvadida();
        
    //Buzzer
    buzzerDisparada();
    
    //pisca o led e o display
    ledDisparado();
}
