#include <stdio.h>
/*
一些浮点型修饰符组合
*/

#define DENSITY 62.4

int main(void)
{

	const double RENT = 3852.99;

	printf("*%f*\n", RENT);

	printf("*%e*\n", RENT);
	printf("*%4.2f*\n", RENT);
	printf("*%3.1f*\n", RENT);
	printf("*%10.3f*\n", RENT);
	printf("*%10.3e*\n", RENT);
	printf("*%+4.2f*\n", RENT);
	printf("*%010.2f*\n", RENT);

	return 0;

}
