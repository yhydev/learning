#include <stdio.h>
#include <time.h>
#include <stdlib.h>



void int_sort(int* srt,const int size){
	int i ;
	int j ;
	int tmp;
	int *max;
	int *min;

	for(i = 0; i < size - 1; i++){
		
		max = (srt + i);
		min = (srt + i + 1);

		if(*max < *min){
			tmp = *max;
			*max = *min;
			*min = tmp;

			for(j = i; j > 0; j--){
				
				max = (srt + j - 1);
				min = (srt + j);

				if(*max < *min){
					tmp = *max;
					*max = *min;
					*min = tmp;
				}else{
					break;
				}
			}
		}
	}
}

int main(){

	srand(time(NULL));

	const int srtsize = 100;
	int srt[srtsize];
	int i;

	for(i = 0; i < srtsize; i++)
		srt[i] = rand() % 10 + 1;
	
	for(i = 0; i < srtsize; i++){
		printf("%d\t", srt[i]);
		if( (i + 1) % 10 == 0){
			putchar('\n');
		}
	}

	int_sort(srt,srtsize);
	puts("----------------------------------");
	for(i = 0; i < srtsize; i++){
		printf("%d\t", srt[i]);
		if( (i + 1) % 10 == 0){
			putchar('\n');
		}
	}

	putchar('\n');


	return 0;
}


