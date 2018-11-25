#include <stdio.h>

int main()
{
	int space_ct = 0,wrap_ct = 0,other_ct = 0;
	char ch;
	printf("enter charset(# quit):");
	while((ch = getchar()) != '#')
	{
		switch(ch)
		{
	//		case ' ':
			case ' ': space_ct++;
				break;
			case '\n': wrap_ct++;
				break;
			default: other_ct++;
		}
	}

	printf("blank space count = %d\nwrap count %d\nother charset count %d\n", space_ct, wrap_ct, other_ct);
	return 0;	

}
