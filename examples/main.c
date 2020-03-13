#include <stdio.h>

int sum(int a, int b) {
    return a * b;
}

int main() {
    int a = 3, b = 3;
    
    int c = sum(a, b);
    printf("Result: %d", c);
}
