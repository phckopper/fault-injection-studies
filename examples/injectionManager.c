#include <stdio.h>
#include <stdlib.h>

size_t shouldInject(void) {
    if(getenv("INJECTION_ADDR")) {
        size_t addr = strtol(getenv("INJECTION_ADDR"), NULL, 10);
        printf("Injecting addr %lu\n", addr);
        return addr;
    } else {
        printf("Not injecting\n");
        return 0;
    }
}
