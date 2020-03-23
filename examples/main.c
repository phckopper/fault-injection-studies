#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <math.h>

#define SEED 992403954
#define ITER 100000

void do_math(void) {
    double abc[10];
    uint32_t inside = 0;
    for(uint32_t i = 0; i < ITER; ++i) {
        float x = (double)rand()/RAND_MAX;
        float y = (double)rand()/RAND_MAX;
        if((x*x + y*y) <= 1)
            inside++;
    }
    double pi = (double) inside/ITER * 4;
    abc[5] = pi;
    printf("%.5f\n", abc[5]);
}

int main() {
    srand(SEED);
    do_math();
    
    return 0;
}
