#include <stdio.h>

int main(int argc,char *argv[]){
	
	FILE *f1;
	FILE *f2;

	if(argc < 3){
		fprintf(stderr, "Useage: %s <fname1> <fname2>\n". argv[0]);
		exit(EXIT_SUCCESS);
	}

	f1 = fopen(argv[1],'r');
	if(f1 == NULL){
		fprintf(stderr, "Can't open %s\n",argv[1]);
		exit(EXIT_SUCCESS);
	}

	f2 = fopen(argv[2],'r');
	if(f2 == NULL){
		fprintf(stderr, "Can't open %s\n",argv[2]);
		exit(EXIT_SUCCESS);
	}
	
	
	

}
