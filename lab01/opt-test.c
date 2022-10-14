#include <stdio.h>

int add(int a, int b)
{
    return a + b;
}

int main()
{
    int a[1024];
    int b[1024];
    int c[1024];
    int d;
    for (int i = 0; i < 1024; i++) {
        a[i] = 1;
    }
    for (int i = 0; i < 1024; i++) {
        b[i] = 2;
    }
    for (int i = 0; i < 1024; i++) {
        c[i] = add(a[i], b[i]);
    }
    for (int i = 512; i >= 1; i /= 2) {
        for (int j = 0; j < i; j++) {
            c[j] = add(c[j], c[j + i]);
        }
    }
    d = c[0];
    printf("%d\n", d);
    return 0;
}