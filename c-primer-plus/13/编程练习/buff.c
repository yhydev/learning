#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]){

	char buff[1024];
	//char ipt[20];
	int i = 0x7fffffff;

	//setvbuf(stdout, buff, _IOFBF, 1024);
	
	setvbuf(stdout, buff, _IOLBF, 1024);
	

	fprintf(stdout, "123\n");
	while(i--){}
//	printf("123");
//	sleep(5);
//	scanf("%s", buff);
	
	//fflush(stdout);

	return 0;

}
