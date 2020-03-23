#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <math.h>

#define SEED 992403954
#define ITER 100000

void do_math(void) {
    uint32_t inside = 0;
    for(uint32_t i = 0; i < ITER; ++i) {
        float x = (float)rand()/RAND_MAX;
        float y = (float)rand()/RAND_MAX;
        if((x*x + y*y) <= 1)
            inside++;
    }
    float pi = (float) inside/ITER * 4;
    printf("%.5f\n", pi);
}

int main() {
    srand(SEED);
    do_math();
    
    return 0;
}
