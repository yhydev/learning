#include <stdio.h>
#include <string.h>
int main(void)
{
	char name[30];
	printf("please enter your name:");
	scanf("%s", name);
	printf("\"%s\"\n", name);
	
	printf("\"%20s\"\n", name);

	printf("\"%-20s\"\n", name);
	

	printf("%*s\n",strlen(name) + 3, name);
	return 0;
}
