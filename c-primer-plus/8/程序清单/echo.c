#include <stdio.h>

int main(){
	
	char ch;
	while((ch = getchar()) != '#'){
		putchar(ch);
	}
//	putchar(ch);
//	putchar(getchar());
	return 0;
}
