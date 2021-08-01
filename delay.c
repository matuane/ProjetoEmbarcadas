#include "delay.h"
#include "pic18f4520.h"
#include "config.h"

void delay(int valor){
    unsigned char j;
    int i;
    
    for (i = 0; i < valor; i++) {
        for (j = 0; j < 255; j++);
        for (j = 0; j < 255; j++);
    }
}
