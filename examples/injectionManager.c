#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <time.h> 

uint64_t counter = 0;
uint64_t addr = 0;
_Bool is_profiling = 0;
_Bool checked_profiling = 0;

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


uint64_t _getCntToInject(void) {
    if(getenv("INJECTION_CNT")) {
        uint64_t cnt = strtol(getenv("INJECTION_CNT"), NULL, 10);
        //printf("Injecting addr %lu\n", addr);
        return cnt;
    } else {
        //printf("Not injecting\n");
        return 0;
    }
}

uint64_t _getInjectionMask(void) {
    if(getenv("INJECTION_MASK")) {
        uint64_t mask = strtol(getenv("INJECTION_MASK"), NULL, 10);
        //printf("Injecting addr %lu\n", addr);
        return mask;
    } else {
        //printf("Not injecting\n");
        return 0;
    }
}

_Bool _is_profiling(void) {
    if(checked_profiling)
        return is_profiling;
    else {
        is_profiling = getenv("INJECTION_PROF") ? 1 : 0;
        checked_profiling = 1;
        return is_profiling;
    }
}

uint64_t _getInjectionMaskIfApplicable(uint64_t address) {
    if(getenv("INJECTION_PROF"))
        printf("%lu\n", address);
    if(!addr) addr = _shouldInject();
    if(address == addr) {
        if(counter == _getCntToInject()) {
            printf("INJECTED!\n");
            counter++;
            return _getInjectionMask();
        } 
        counter++;
        //printf("@%lu cnt %lu\n", address, counter);
    }
    return 0;
}
