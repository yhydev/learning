#include <stdio.h>

int main()
{
	int count = 0;
	char pre_ch;
	char ch;
	while( ( ch = getchar()) != '#')
	{
		if(pre_ch == 'i' && ch == 'e')
			count++;
		pre_ch = ch;
		
	}

	printf("ie count = %d\n", count);

}
