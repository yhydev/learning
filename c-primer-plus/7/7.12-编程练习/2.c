#include <stdio.h>

int main()
{
	int space_ct = 0,wrap_ct = 0,other_ct = 0;
	char ch;
	int count = 0;
	printf("enter charset(# enter):");
	while((ch = getchar()) != '#')
	{
		count++;
		printf("%-5d", ch);
		if(count % 8 == 0)
		{
			printf("\n");
		}

	}

	printf("\n");

	return 0;	

}
