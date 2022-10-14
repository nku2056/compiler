#include "sylib.h"
//test while
int main()
{
    int a;
    const int z = 0;
    a = 6;
    while(a != z)
    {
        a = a - 1;
    }
    putint(a);
    return 0;
}
