#define MSG "I'm special"
#include <stdio.h>

int main(){
	char ar[] = MSG;
	char *pt = MSG;

//	pt[0] = 'i';

	printf("address of \"I'm special\": %p\n","I'm special");
	printf("address ar:	%p\n", ar);
	printf("address pt:	%p\n", pt);
	printf("address MSG：	%p\n", MSG);

	printf("address of \"I'm special\": %p\n","I'm special");


	return 0;
}
