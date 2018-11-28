/* count.c -- 使用标准 I/O */
#include <stdio.h>
#include <stdlib.h> //提供exit() 的原型

int main(int argc, char *argv[]){
	int ch;		//读取文件时，存储每个字符的地方
	FILE *fp;	// “文件指针”
	const int fnmsize = 40;
	char fname[fnmsize];

	printf("Enter count file name:");
	scanf("%s", fname);


	unsigned long count = 0;

	if((fp = fopen(fname, "r")) == NULL){
		printf("Can't open %s \n", fname);
		exit(EXIT_FAILURE);
	}

	while((ch = getc(fp)) != EOF){
		putc(ch, stdout);
		count++;
	}

	fclose(fp);
	printf("File %s has %lu characters\n", fname, count);
	
	return 0;
}
