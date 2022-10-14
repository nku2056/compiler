#include "sylib.h"
//test if
int main()
{
    int a;
    a = getint(a);
    if(a <= 10 && a > 0)
    {
        a = a + 1;
    }
    putint(a);
    return 0;
}
