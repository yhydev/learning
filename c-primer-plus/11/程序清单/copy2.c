#include <stdio.h>
#include <string.h>

#define WORDS "beast"
#define SIZE 40

int main(void){
	
	const char * orig = WORDS;
	char copy[SIZE] = "Be the best that you can be.";
	char * ps;
	puts(orig);
	puts(copy);
	ps = strcpy(copy + 7, orig);
	puts(ps);
//	puts(copy); strcpy 将orig 的 "\0" 也拷贝进了copy 数组 
	return 0;
}
