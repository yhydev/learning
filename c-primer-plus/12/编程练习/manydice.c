/*manydice.c -- 多次掷色子的模拟程序*/
/*与 diceroll.c 一起编译*/

#include <stdio.h>
#include <stdlib.h> /*为库函数 srand() 提供原型*/
#include <time.h>
#include "diceroll.h"

int main(void){
	int dice, roll;
	int sides;
	int status;
	int sets;
	srand((unsigned int)time(0));
	

	printf("Enter the number of sets; enter q to stop:\t");
	while(scanf("%d",&sets) == 1){
		
		
		printf("How many sides and How many dice?\t");
		enter_sides_dice:
		if(scanf("%d %d", &sides, &dice) == 2 && sides > 0 && dice > 0){
			printf("Here are %d sets of %d %d-sided throws.\n", sets, dice, sides);
			while(0 <= --sets){
				roll = roll_n_dice(dice, sides);
				printf("%d\t", roll);
			}
			putchar('\n');
		}else{
			printf("Invalid input, Try again:\t");
			while(getchar() != '\n')
				continue;
			goto enter_sides_dice;
		}
			
		printf("Enter the number of sets; enter q to stop\t");
	}

	printf("The rollem() function was called %d times.\n", roll_count);
	printf("GOOD FORTUNE TO YOU!\n");

}
