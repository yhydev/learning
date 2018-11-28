#include <stdio.h>


int main(void)
{
	int number;
	int max;
	printf("please enter number:");
	scanf("%d", &number);
	max = number + 10;
	while(number <= max)
	{
		printf("%d\t", number++);
	}
	printf("\n");
	return 0;
}
