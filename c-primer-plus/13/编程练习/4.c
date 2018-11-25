#include <stdio.h>

int main(int argc,char *argv[]){

	int i;
	FILE *fp;
	const size_t bufsize = 1024;
	size_t readsize;
	char buf[bufsize];

	for(i = 1; i < argc; i++){
		
		fp  = fopen(argv[i],"r");
		if(fp == NULL){
			fprintf(stderr, "Can't open file %s.\n", argv[i]);
		}else{
			while(0 < (readsize = fread(buf, 1, bufsize, fp))){
				fwrite(buf, 1, readsize, stdout);
			}

			fclose(fp);
		
		}
	
	}

	return 0;

}
