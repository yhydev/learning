#include <stdio.h>

#define MINUTE 60.00

int main(void)
{
	int day;


	while( printf("please enter days(le 0 exit):") && scanf("%d", &day) && day > 0){
		printf("%d days are %d weeks, %d days\n", day, day / 7, day % 7);
	}
	return 0;
}
