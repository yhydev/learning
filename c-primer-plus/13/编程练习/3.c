#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>

char *s_gets(char *, int);

int main(void){
	const int fsize = 40;
	char fname[fsize];
	char *buff;
	FILE *fp;
	int ch;

	puts("Convert file content to upper");
	puts("Enter a file:");

	if(s_gets(fname, fsize) && fname[0] != '\0'){
		
		if((fp = fopen(fname, "r+")) == NULL){
			fprintf(stdout, "Open %s failed.\n", fname);
			exit(EXIT_FAILURE);
		}

		while((ch = getc(fp)) != EOF){
			
			printf("file content random location of %ld\n", ftell(fp));
			fseek(fp, -1L, SEEK_CUR);
			fputc(toupper(ch), fp);
			
		}

		fclose(fp);

	}

	return 0;
}

char *s_gets(char *fp, int n){

	char *find;
	char *ret = fgets(fp, n, stdin);
	
	if(ret){
		find = strchr(ret,'\n');
		if(*find == '\n')
			*find = '\0';
		else
			while(getchar() != '\n')
				continue;
			
	}

	return ret;
}
