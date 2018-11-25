#include <stdio.h>

double cube(double n);

int main()
{
	double num;
	printf("enter a double number:");
	scanf("%lf", &num);
	printf("%lf cube = %lf\n", num, cube(num));
	return 0;
}


double cube(double n)
{
	return n * n * n;
}
