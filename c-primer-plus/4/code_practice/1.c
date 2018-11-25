#include <stdio.h>

int main(void)
{
	char fname[10],lname[10];
	printf("please enter your name:");
	scanf("%s%s", fname, lname);
	printf("%s,%s\n", lname, fname);
	
	
	return 0;
}
