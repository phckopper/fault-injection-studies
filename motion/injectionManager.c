#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <time.h> 

uint64_t _shouldInject(void) {
    if(getenv("INJECTION_ADDR")) {
        uint64_t addr = strtol(getenv("INJECTION_ADDR"), NULL, 10);
        //printf("Injecting addr %lu\n", addr);
        return addr;
    } else {
        //printf("Not injecting\n");
        return 0;
    }
}

uint64_t _getInjectionMask(uint64_t bitwidth) {
    srand(time(NULL));
    uint64_t mask = (1 << (rand() % bitwidth));
    printf("Width: %lu Mask: %x \n", bitwidth, mask);
    return mask;
}

void _printCounter(uint64_t *cnt) {
    printf("Ran %ld instructions\n", *cnt);
}
