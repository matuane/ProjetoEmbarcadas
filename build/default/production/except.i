# 1 "except.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 288 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "C:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\language_support.h" 1 3
# 2 "<built-in>" 2
# 1 "except.c" 2
# 1 "./expect.h" 1
# 11 "./expect.h"
void exceptDesarmado();
void exceptArmado();
# 1 "except.c" 2

# 1 "./lcd.h" 1
# 23 "./lcd.h"
 void lcdCommand(unsigned char cmd);
 void lcdData(unsigned char valor);
 void lcdInit(void);
# 2 "except.c" 2

# 1 "./bits.h" 1
# 3 "except.c" 2

# 1 "./delay.h" 1
# 11 "./delay.h"
void delay(int valor);
# 4 "except.c" 2



void exceptDesarmado(){
    int i;
    char mensage[20]= "Central ja desarmada";
    lcdInit();

    lcdCommand(0x01);
    lcdCommand(0x85);
    for(i = 0; i<20; i++){
        if(i == 8){
            lcdCommand(0xC2);
        }
        lcdData(mensage[i]);
    }
    for(i = 0; i<5; i++){
        delay(500);
    }
    lcdCommand(0x01);

}

void exceptArmado(){
    int i;
    char mensage[20]= "Central ja armada";
    lcdInit();

    lcdCommand(0x01);
    lcdCommand(0x85);
    for(i = 0; i<20; i++){
        if(i == 8){
            lcdCommand(0xC4);
        }
        lcdData(mensage[i]);
    }
    for(i = 0; i<5; i++){
        delay(500);
    }
    lcdCommand(0x01);

}
