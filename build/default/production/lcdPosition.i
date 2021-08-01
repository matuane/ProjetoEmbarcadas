# 1 "lcdPosition.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 288 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\language_support.h" 1 3
# 2 "<built-in>" 2
# 1 "lcdPosition.c" 2
# 1 "./lcdPosition.h" 1



void lcdPosition(unsigned char coluna, unsigned char linha);
# 1 "lcdPosition.c" 2

# 1 "./lcd.h" 1
# 23 "./lcd.h"
 void lcdCommand(unsigned char cmd);
 void lcdData(unsigned char valor);
 void lcdInit(void);
# 2 "lcdPosition.c" 2







void lcdPosition(unsigned char coluna, unsigned char linha){

    char comando = 0;

    if(linha==0) comando = 0x80 + linha;
    if(linha == 0) comando = 0x80 + coluna;

    if(linha == 0 && comando != 0x01) comando = 0x80 + coluna;
    if(linha == 1 && comando != 0x01) comando = 0xC0 + coluna;
    if(coluna > 15){
        coluna = 0;
    }
    if(coluna < 0){
        coluna = 15;
    }

    lcdCommand(comando);
}
