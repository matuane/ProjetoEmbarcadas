#include "lcdPosition.h"
#include "lcd.h"

#define L0 0x80
#define L1 0xC0
#define CLR 0x01
#define ON 0x0F

void lcdPosition(unsigned char coluna, unsigned char linha){
    
    char comando = 0;
    
    if(linha==0) comando = L0 + linha;
    if(linha == 0) comando = L0 + coluna;
    
    if(linha == 0 && comando != CLR) comando = L0 + coluna;
    if(linha == 1 && comando != CLR) comando = L1 + coluna;
    if(coluna > 15){
        coluna = 0;
    }
    if(coluna < 0){
        coluna = 15;
    }
    
    lcdCommand(comando);
}
