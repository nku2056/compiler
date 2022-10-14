#include<stdio.h>
int c = 0;
int fib(int a,int b)
{
	return a + b;
}
int main()
{
	float f1 = 1.5;
	float f2 = 2.5;
	float f3 = f1 + f2;
	int a, b, i, n;//define
	a = 0;
	b = 1;
	i = 1;
	scanf("%d", &n);
	int f[n];
	f[0] = 1;//init
	while (i < n)
	{
		f[i]= fib(a, b);
		a = f[i - 1];
		b = f[i];
		i = i + 1;
	}
	printf("%d\n", f[n - 1]);
	printf("%d\n", c);
	printf("%f\n", f3);
	return 0;
}
