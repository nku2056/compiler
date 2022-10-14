#include <stdio.h>
int add(int a, int b)
{
	return a + b;
}

int main()
{
	int a, b, c;
	a = 2;
	b = 5;
	c = add(a, b);
	printf("%d", c);
	return 0;
}
