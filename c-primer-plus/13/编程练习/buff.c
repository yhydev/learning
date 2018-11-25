#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
int main(int argc, char *argv[]){
	const unsigned bufsize = 1024;
	char buf[bufsize];

	//setvbuf(stdout, buff, _IOFBF, 1024);
	
	setvbuf(stdout, buf, _IOLBF, bufsize);
	

	fprintf(stdout, "123\ncctv");
	fprintf(stderr, buf);
	sleep(2);
	//fflush(stdout);

	return 0;

}

