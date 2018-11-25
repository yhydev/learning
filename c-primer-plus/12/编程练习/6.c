#include <stdio.h>
#include <time.h>
#include <stdlib.h>

#define ARRSIZE 10
int main(){

	srand(time(NULL));

	const int size = 100;
	int countarr[ARRSIZE] = {0};
	int i;

	for(i = 0; i < size; i++)
		countarr[rand() % 10]++;

	for(i = 0; i < ARRSIZE; i++)
		printf("%d\t", countarr[i]);

	putchar('\n');


	return 0;
}


