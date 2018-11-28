#include <stdio.h>

int strlen2(const char *);

int main(void){
	
	char *str = "hello world!!";

	printf("str length = %d\n", strlen2(str));


	return 0;
}



int strlen2(const char *str){
	int ret = 0;
	while(*str++)
		ret++;

	return ret;
}
