#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]){
	
	const int bufsize = 0xff;
	FILE *src, *des;
	char buf[bufsize];
	size_t rcount;
	if(argc != 3){
		fprintf(stderr, "Useage: %s <filename1> <filename2>\n", argv[0]);
		exit(EXIT_FAILURE);
	}

	if((src = fopen(argv[1],"r")) == NULL){
		fprintf(stderr, "Can't open %s", argv[1]);
		exit(EXIT_FAILURE);
	}

	if((des = fopen(argv[2],"w")) == NULL){
		fprintf(stderr, "Can't open %s", argv[2]);
		exit(EXIT_FAILURE);
	}

	while((rcount = fread(buf, 1, bufsize, src)) > 0){
		fwrite(buf, 1, bufsize, des);
	}


	fclose(des);
	fclose(src);

	return 0;

}
