#include <stdio.h>

int main(void){
	
	int guess = 1;
	int resp = 0;
	printf("Pick on integer from 1 to 100. I will try to guess");
	printf("it.\nRespond with a y if my guess is right and with");
	printf("\nan n if it is wrong.\n");
	printf("Uh... is your number %d?\n", guess);
	while( (resp = getchar()) != 'y'){

		if(resp == 'n')
			printf("Well, then, is it %d?\n", ++guess);
		else
			printf("Sorry, I understand only y or n.\n");

		while(getchar() != '\n'){
		}

	}

	printf("I knew i could do it!\n");

	return 0;

}
