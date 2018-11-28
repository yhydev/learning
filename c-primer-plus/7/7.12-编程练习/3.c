#include <stdio.h>

int main()
{
	int even_c = 0,odd_c = 0;
	float even_a,odd_a;
	int c;
	while(printf("enter a number(0 to exit):") && scanf("%d", &c) && c)
	{
		if(c % 2)
		{
			odd_c++;
			odd_a += c;	
		}else
		{
			even_c++;
			even_a += c;

		}
	}
	if(even_c)
		printf("even count = %d,average = %f\n", even_c, even_a / even_c);
	if(odd_c)
		printf("odd count = %d,average = %f\n", odd_c, odd_a / odd_c);
	return 0;	

}
