#include <stdio.h>
#define SIZE 10

int sum(int ar[],int n);


int main(void){

	int marbles[SIZE] = {20, 10, 5, 39, 4, 16, 19, 26, 31, 20};
	long answer;
	answer = sum(marbles, SIZE);

	printf("The total number of marbles is %ld.\n", answer);
	printf("The size of marbles is %zd bytes.\n", sizeof marbles);

	return 0;
}


int sum(int ar[],int n){
	int total = 0;
	int index;
	for(index = 0; index < n; index++)
		total += ar[index];
	printf("The size of ar is %zd bytes.\n", sizeof ar);
	return total;

}
