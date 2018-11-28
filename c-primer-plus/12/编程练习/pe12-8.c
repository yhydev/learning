#include <stdio.h>
#include <stdlib.h>

int *make_array(int elem, int val);
void show_array(const int arr[], int n);

int main(void){
	int *pa;
	int size;
	int value;
	printf("Enter the number of elements: ");
	while(scanf("%d", &size) == 1 && size >0){
		printf("Enter the initialization value: ");
		scanf("%d", &value);
		pa = make_array(size, value);

		if(pa){
			show_array(pa, size);
			free(pa);
		}

		printf("Enter the number of elements (<1 to quit):");
	}
	
	printf("Done.\n");
	return 0;

}



int *make_array(int elem, int val){
	int *arr = malloc(sizeof(int) * elem);
	if(arr){
		while(0 <= --elem){
			*(arr+elem) = val;
//			printf("%d\t",*(arr+elem));
		}
		printf("\n");
	}
	return arr;

}


void show_array(const int arr[], int n){
	while(0 <= --n){
		printf("%d\t", *(arr+n));
		if(n % 8 == 0)
			putchar('\n');
	}
}
