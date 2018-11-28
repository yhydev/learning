#include <stdio.h>


int isPrime(int num);

int main(){
	
	int num;
	int i = 2;
	printf("Enter a integer number:");
	scanf("%d", &num);

	for(; i <= num; i++){
		if(isPrime(i))
			printf("%d\t", i);
	}
	printf("\n");

	return 0;
    	
}


int isPrime(int num){
	int i = 2;
	for(;i < num; i++){
		if(num % i == 0){
			return 0;
		}
	}
	return 1;
}
