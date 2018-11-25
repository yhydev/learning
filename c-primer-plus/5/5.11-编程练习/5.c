#include <stdio.h>

int main()
{
	int days;
	int count = 0;
	int sum = 0;
	printf("enter a number:");
	scanf("%d", &days);
	while( count++ < days){
		sum += count;
	}	
	printf("sum = %d\n", sum);

	return 0;
}
