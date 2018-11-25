#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
int main(int argc,char *argv[]){
	
	const size_t bufsize = 1024;	
	FILE *f1;
	FILE *f2;
	char buf[bufsize];
	
	int readbytes = 1;

	if(argc < 3){
		fprintf(stderr, "Useage: %s <fname1> <fname2>\n",  argv[0]);
		exit(EXIT_FAILURE);
	}

	f1 = fopen(argv[1], "r");
	if(f1 == NULL){
		fprintf(stderr, "Can't open %s\n",argv[1]);
		exit(EXIT_FAILURE);
	}

	f2 = fopen(argv[2], "r");
	if(f2 == NULL){
		fprintf(stderr, "Can't open %s\n",argv[2]);
		exit(EXIT_FAILURE);
	}
	
	if(setvbuf(f1, buf, _IOLBF, bufsize) != 0){
		puts("set _IOLBF fail");
		exit(EXIT_FAILURE);
	}
	
	while(readbytes){
		while(0 < (readbytes = fread(buf, 1, bufsize, f1))){
		//	readbytes = fread(buf, 1, bufsize, f1);
		//	fprintf(stdout,"%s - %s | of %d bytes", argv[1], buf, readbytes);
		//	sleep(2);
			fwrite(buf, 1, readbytes, stdout);
		}	

	}

	fclose(f1);
	fclose(f2);
	
	return 0;
}
