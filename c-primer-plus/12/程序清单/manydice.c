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

	srand((unsigned int)time(0));

	printf("Enter the number of sides per die, 0 to stop.\n");
	while(scanf("%d", &sides) == 1 && sides > 0){
		printf("How many dice?\n");
		if((status = scanf("%d", &dice)) != 1){
			if(status ==EOF)
				break;
			else{
				printf("You should have entered an integer.");
				printf(" Let's begin again.\n");
				while(getchar() != '\n')
					continue;
				printf("How many sides? Enter 0 to stop.\n");
				continue;
			}
		}

		roll = roll_n_dice(dice, sides);
		printf("Your have rolled a %d using %d %d-side dice.\n", roll, dice, sides);
		printf("How many sides? Enter 0 to stop.\n");
		
	}

	printf("The rollem() function was called %d times.\n", roll_count);
	printf("GOOD FORTUNE TO YOU!\n");

}
