#include <stdio.h>

#define MINUTE 60.00

int main(void)
{
	int minute = 1;

	printf("please enter minute(le 0 exit):");
	while(scanf("%d", &minute) && minute > 0){
		printf("%d minute eq %.2f hour\n", minute, minute / MINUTE);
		
		printf("please enter minute(le 0 exit):");
	}
	return 0;
}
