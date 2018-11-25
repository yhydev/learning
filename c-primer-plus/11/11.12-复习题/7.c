#include <stdio.h>
#include <string.h>

#define M1 "How are ya, sweetie? "

char M2[40] = "Beat the clock.";
char *M3 = "chat";

int main(void){
	
	char words[80];
	printf(M1);
	puts(M1);// How are ya, sweetie? How are ya, Sweetie? 
	puts(M2);// Beat the clock.
	puts(M2 + 1);// eat The clock.

	strcpy(words, M2);
	strcat(words, " Win a toy.");
	puts(words); // Beat the clock. Win a toy.

	words[4] = '\0';
	puts(words); // Beat

	while(*M3)
		puts(M3++); /*
					chat
					hat
					at
					t
					*/
	
	puts(--M3);// t
	puts(--M3);// at
	M3 = M1;

	puts(M3);// How are ya, sweetie? 
	
	return 0;
	
}
