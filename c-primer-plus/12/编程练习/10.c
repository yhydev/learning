#include <stdio.h>
#include <stdlib.h>

int main(void){
	
	char **strp;
	int size;
	int index;

	printf("How many words do you wish to enter?");
	scanf("%d", &size);
	strp = malloc(size * (sizeof(char**)));
	
//	printf("sizeof strp =  %lu", sizeof(strp));	
	printf("Enter %d words now:", size);

	for(index = 0; index < size; index++){
		char *word = malloc(sizeof(char) * 100);
//		char word[100];
		scanf("%s",word);
		*(strp+index) = word;
	}


	for(index = 0; index < size; index++){
//		printf("%d %p %s\n", index, *(strp+index), *(strp+index));
		puts(*(strp+index));
		free(*(strp+index));
	}

	free(strp);	
	
	return 0;
}
