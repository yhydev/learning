#include <stdio.h>

int main()
{
	int replace_count = 0;
	char ch;
	while( (ch = getchar()) != '#')
	{
		if(ch == '.')
		{
			putchar('!');
			replace_count++;
			continue;
		}
		else if(ch == '!')
		{
			putchar('!');
			putchar('!');
			replace_count ++;
			continue;
		}
		putchar(ch);
		
	}

	printf("replace count = %d\n", replace_count);

}
