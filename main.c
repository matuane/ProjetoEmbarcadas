#include "config.h" 
#include "pwm.h"
#include "cooler.h"
#include "expect.h"
#include "Armada.h"
#include "centralDesarmada.h"
#include "keypad.h"
#include "bits.h"
#include "casaInvadida.h"
#include "delay.h"
#include "config.h"
#include "pic18f4520.h"
#include "printf.h"
#include "lcd.h"

//inicio do programa 
void main(void) { 
    //Decalração das vareáveis
    int i, op = 0, x = 1;
    int cont = 0;
    unsigned int verifica, v;
    int valor = 0, ver =0, lc = 0;
    int ar = 0;   
   
    
    for(;;){
        //Inicialização do Teclado Matricial
        kpInit();
        
        //Chama a função LCD
        if(lc == 0){
            mensagemInicial();
            lc = 1;
        }
        
        
        //Captura da entrada do usuário pelo teclado matricial
            if(kpRead() != verifica){
                
                verifica = kpRead();

                if(bitTst(kpRead(),3)){
                    if(ar != 1){
                        op = 1;
                        ar = 1;
                    }else{
                        op = 5;
                    }
                }

                if(bitTst(kpRead(), 7)){
                    if(ar == 1){
                        op = 2;
                        ar = 0;
                    }
                    else{
                        op = 4;
                    };
                }
                if(bitTst(kpRead(), 11)){
                    if(ar == 1){
                        op = 3;
                    }
                }
            }
             kpDebounce(); 
             
             switch(op){
                case 1:
                    lcdCommand(0x01);//Limpa o LCD
                    armada();
                    cooler();
                    op = 0;
                    ADCON1 = 0x00; //config AD
                    break;
                    
                case 2: 
                    centralDesarmada();
                    op = 0;
                    ADCON1 = 0x00; //config AD
                    pwmSet1(0);
                    lc = 0;
                    break;
                case 3:
                    for( i = 0; i<20; i++){
                        casaInvadida();
                    }
                      //Desliga relé 1
                        PORTC = 0x00;
                        //Desliga relé 2
                        PORTE = 0x00;
                    //Chama a função de desarme da Central
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