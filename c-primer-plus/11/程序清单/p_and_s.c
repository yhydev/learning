#include <stdio.h>

int main(void){
	const char * mesg = "Dot't be a fool!";
	const char *copy;
	copy = mesg;

	printf("mesg = %s; &mesg = %p value = %p\n", mesg, &mesg, mesg);

	
	printf("copy = %s; &copy= %p value = %p\n", copy, &copy, copy);

	return 0;
}
