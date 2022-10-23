#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main()
{
	char b[10];
	memset(b, 0, 10);
	b[0] = '0';
	b[1] = '1';
	b[2] = '.';
	b[3] = '5';
	b[4] = 'e';
	b[4] = '3';
	float c = 0;
	c = atof(b);
	printf("%f", c);
	return 0;
}