#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

uint64_t _shouldInject(void) {
    if(getenv("INJECTION_ADDR")) {
        uint64_t addr = strtol(getenv("INJECTION_ADDR"), NULL, 10);
        printf("Injecting addr %lu\n", addr);
        return addr;
    } else {
        printf("Not injecting\n");
        return 0;
    }
}

uint32_t _getInjectionMask(void) {
    if(getenv("INJECTION_MASK")) {
        uint32_t mask = strtol(getenv("INJECTION_MASK"), NULL, 10);
        printf("Mask: %08X\n", mask);
        return mask;
    }
    return 0;
}
