/* put1.c 打印字符串，不添加\n */
#include <stdio.h>

int put2(const char * string){
	int count = 0;
	while(*string){
		putchar(*string++);	
		count++;	
	}

	putchar('\n');
	return(count);
}
