#include "printf.h"
#include "lcd.h"
#include "config.h"
#include "lcdPosition.h"

void mensagemInicial(){
    //Variaveis
    int i;
    
    //Mensagem
     char msg[35] = "Alarme Digite: 1(Armar) 2(Desarmar)"; 
    
    //Inicializa o LCD
    lcdInit();
    
    //Print da mesagem no LCD
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
    
    //Variaveis
    int i;
    char msg[18] = "Central Desarmada";
    
    
    //Inicializa o lcd
    lcdInit();
    
    //Impressão da mesagem no LCD
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
    
    //Inicializa o LCD
    lcdInit();
    
    //Impressão da mensagem no LCD
    lcdCommand(0x01);//Limpa o LCD
    lcdPosition(4, 0);//Inicia na primeira linha 4 coluna do LCD
    
    //Imprime a mensagem
    for(i=0;i<14;i++) {
        lcdData(msg[i]);
        if (i == 7) {
            lcdCommand(0xC4);//Caso i == 7, pula uma linha e imprime na coluna 5
        }
    }
}

void mensagemInvadida(){
    
    //Variaveis
    int i;
    char msg[19] = "Residencia Invadida";
    
    //Inicia o LCD
    lcdInit();
    
    //Pula uma linha e imprime na 4 coluna
    lcdCommand(0xC3);
    
    //Imprime a mensagem
    for(i=0; i<19; i++){
        lcdData(msg[i]);
        if (i == 10) {
            lcdCommand(0x94);//Pula uma linha e imprime na 5 coluna
        }
    }
}
