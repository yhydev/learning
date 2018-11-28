#include <stdio.h>

#define LEVEL_1_MONEY 17850
#define LEVEL_2_MONEY 23900
#define LEVEL_3_MONEY 29750
#define LEVEL_4_MONEY 14875

#define TAX_RATIO 0.15
#define OVER_TAX_RATIO 0.28


int main(){
	
	int level;	
	float salay;
	float money;
	float tax;
	float post_tax_salay;

	while(printf(
		"Enter your tax type\n"
		"1)单身\t\t\t 2)户主\n"
		"3)已婚,共有\t\t\t 4)已婚,离异\n"
		"5)退出\n"
	) && scanf("%d", &level) && level != 5){
		

		switch(level){
			case 1:
				money = LEVEL_1_MONEY;
				break;
			case 2:
				money = LEVEL_2_MONEY;
				break;
			case 3:
				money = LEVEL_3_MONEY;
				break;
			case 4:
				money = LEVEL_4_MONEY;
				break;
				
		}

		printf("Enter your salay:");

		scanf("%f", &salay);

		

		tax =  money * TAX_RATIO + (salay - money) * OVER_TAX_RATIO;
		post_tax_salay = salay - tax;

		printf("Your tax = %f, salay = %f", tax, post_tax_salay);
	
	
	}


}
