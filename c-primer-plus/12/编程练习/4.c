#include <stdio.h>


void count(){
	static int count = 0;
	count++;
	printf("I count %d\n", count);
}


int main(){
	
	for(int i = 0; i < 10; i++){
		count();
	}

}
