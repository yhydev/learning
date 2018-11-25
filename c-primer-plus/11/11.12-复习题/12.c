#include <stdio.h>

char * findSpace(char *);


int main(){
	
	char str[0xff];
	char *p;
	
	puts("enter a string:");
	fgets(str, 0xff, stdin);

	p = findSpace(str);

	if(p != NULL)
		printf("%s space find.\n", str);

	return 0;
}


char * findSpace(char *str){
	while(*str++ != '\0'){
		if(*str == ' '){
			break;
		}
	}
	return str;
}
