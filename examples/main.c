#include <stdio.h>

int math(int a, int b) {
    int c = a + b;
    c++;
    if(c > 10)
        c = 2;
    c = c * a;
    c = c / b;
    if(a % 2 == 0)
        c = c + a + b;
    return c;
}

int main() {
    int a = 3, b = 3;
    
    int c = math(a, b);
    printf("%d", c);
}
