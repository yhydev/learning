#include <stdio.h>

int main(void)
{
	double i;
	printf("enter a float number:");
	scanf("%lf", &i);
	printf("%lf %E", i, i);

	return 0;
}
