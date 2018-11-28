#include <stdio.h>

#define ADJUST 7.31
int main(void)
{
	const double SCALE = 0.333;
	double shoe, foot;
	shoe = 3.0;
	printf("Shot size (men's) foot length\n");
	
	while(shoe < 18.5)
	{
		foot = SCALE * shoe + ADJUST;
		printf("%10.1f %15.2f inches\n", shoe, foot);
		shoe = shoe + 1.0;
	}
	printf("If the shoe fits, wear it.\n");
	return 0;
}
