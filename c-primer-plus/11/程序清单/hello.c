#include <stdio.h>
#include <stdlib.h>

int main(int argc,char *argv[]){
	
	int i, times;

//	puts(argv[1]);

	if(argc < 2 || (times = atoi(argv[1])) < 1)
		printf("Usage: %s positive-number\n", argv[0]);
	else
		for(i = 0; i < times; i++)
			puts("Hello, good looking!");
	
//	printf("%d\n", times);

	return 0;
}
