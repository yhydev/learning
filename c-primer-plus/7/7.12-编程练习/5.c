#include <stdio.h>

int main()
{
	int replace_count = 0;
	char ch;
	while( (ch = getchar()) != '#')
	{
		
		switch(ch){
			
			case '!':putchar('!');
			case '.': replace_count++;
				putchar('!');
				break;
			default: putchar(ch);
		}
			
		
	}

	printf("replace count = %d\n", replace_count);

}
