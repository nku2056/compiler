#include <stdio.h>

struct value{
	int ival;
	float fval;
};

int main()
{
	struct value a, b, c;
	a.ival = 1;
	b.ival = 2;
	c = a;
	printf("%d\n", c.ival);
	return 0;
}