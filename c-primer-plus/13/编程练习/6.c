// reducto.c - 把文件压缩成原来的 1/3 !
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define LEN 40

int main(){

	FILE *in, *out;
	int ch;
	char name[LEN];
	char srcname[LEN];
	int count = 0;
	puts("Enter a filename:");
	scanf("%s", srcname);

	if((in = fopen(srcname, "r")) == NULL){
		fprintf(stderr, "I couldn't the file \"%s\"\n", srcname);
		exit(EXIT_FAILURE);
	}

	strncpy(name, srcname, LEN - 5);
	name[LEN - 5] = '\0';
	strcat(name, ".red");

	if((out = fopen(name, "w")) == NULL){
		fprintf(stderr, "Can't create file.\n");
		exit(3);
	}

	while((ch = getc(in)) != EOF)
		if(count++ % 3 == 0)
			putc(ch, out);
	
	if(fclose(in) != 0 || fclose(out) != 0)
		fprintf(stderr, "Error in closing files\n");

	return 0;


}
