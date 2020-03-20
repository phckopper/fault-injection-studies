#include <stdio.h>
#include <math.h>

#define N 99

void print_if_prime(int n) {
   int i = 3;

   if(n % 2 == 0) {
       printf("%d NOT PRIME\n", n);
       return;
   }

   int limit = (int) sqrt(n); // force cast to int so we can inject
   if(n <= 2) {
       *(volatile int*)0 = 0;
   }
   while(i < limit) {
        if(n % i == 0) {
            printf("%d NOT PRIME\n", n);
            return;
        }
        i += 2;
   }
   printf("%d PRIME\n", n);
}

int main() {
    for(int i = 3; i < N; ++i)
        print_if_prime(i);
    
    return 0;
}
