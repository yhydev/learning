#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define BUFSIZE 4096
#define SLEN 81

void append(FILE *,FILE *dest);

char *s_gets(char *,int);

int main(int argc, char *argv[]){
	FILE *fa, *fs;		//fa 指向目标文件，fs 指向源文件
	int findex = 0;
	int ch;

	if(argc < 3){
		fprintf(stderr, "Useage: %s <append filename1> <src filename1> [<src filename2> ...]\n", argv[0]);
		exit(EXIT_FAILURE);
	}

	
	if((fa = fopen(argv[1], "a+")) == NULL){
		fprintf(stderr, "Can't open %s\n", argv[1]);
		exit(EXIT_FAILURE);
	}

	if(setvbuf(fa, NULL, _IOFBF, BUFSIZE) != 0){
		fputs("Cant't create buffer", stderr);
		exit(EXIT_FAILURE);
	}

	for(findex = 2; findex < argc; findex++){
	if(strcmp(argv[1], argv[findex]) == 0){
			fputs("Can't append file to itself\n", stderr);
		}else if((fs = fopen(argv[findex], "r")) == NULL){
			fprintf(stderr, "Can't open %s\n", argv[findex]);
		}else{
			if(setvbuf(fs, NULL, _IOFBF, BUFSIZE) != 0){
				fputs("Can't create input buffer\n", stderr);
				continue;
			}
		

			append(fs, fa);

			if(ferror(fs) != 0)
				fprintf(stderr, "Error in reading file %s.\n", argv[findex]);

			if(ferror(fa) != 0)
				fprintf(stderr, "Error in writing file %s.\n", argv[1]);

			fclose(fs);
			findex++;
			printf("File %s appended.\n", argv[findex]);
			puts("Next file(empty line to quit)");
		}
//		puts("Enter name of first source file(empty line to quit):")
	}

	printf("Done appending.%d findex appended.\n", findex);
	rewind(fa);
	printf("%s contents:\n", argv[1]);
	while((ch = getc(fa)) != EOF)
		putchar(ch);
	
	puts("Done displaying.");
	fclose(fa);

	return 0;
}

void append(FILE *source, FILE *dest){
	size_t bytes;
	static char temp[BUFSIZE];
	while((bytes = fread(temp, sizeof(char), BUFSIZE, source)) > 0){
		fwrite(temp, sizeof(char), bytes, dest);
	}

}

