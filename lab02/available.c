#include "sylib.h"
int main()
{
    int a = 10;
    int b = 0;
    while(a > 0)
    {
        const int c = -1;
        if(a > 5)
        {
            a = a - 1;
            continue;
        }
        b = b + c;
        if(b < -5)
        {
            break;
        }
    }
    putint(b);
    return 0;
}
