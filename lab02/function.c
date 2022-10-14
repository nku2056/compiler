#include "sylib.h"
int f(int a,int b)
{
    int c;
    c = (a % b) + (a | b);
    return c;
}
int main()
{
    int a , b;
    a = 16;
    b = 32;
    int c = f(a,b);
    putint(c);
    return 0;
}
