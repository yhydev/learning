#include <stdio.h>
#include <stdlib.h>

int main(){

	FILE *fp;
	char content1[100] = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	char content2[100] = "0123456789abcdefghijklmnopqrstuvwxyz";	

	if((fp = fopen("test", "w+")) == NULL){
		fputs("open file failure", stderr);
		exit(EXIT_FAILURE);
	}

	
	fputs(content1, fp);
	fputc('\n', fp);
	fputs(content2, fp);
	fputc('\n', fp);


	fseek(fp, 10, SEEK_SET);

	fputc('\n', fp);











	fclose(fp);

	return 0;

}
