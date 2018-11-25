#include <stdio.h>

#define BASE_SALARY  1000.00
#define BASE_WORK_HOUR  40
#define OVER_TIME_SALARY  BASE_SALARY * 1.5

#define TAX_RATIO_1 0.15 //阶段1 收费百分百
#define TAX_SUM_1 300
#define TAX_1 TAX_SUM_1 * TAX_RATIO_1

#define TAX_RATIO_2 0.2
#define TAX_SUM_2  450
#define TAX_2 TAX_1 + TAX_RATIO_2 * 150


#define TAX_RATIO_3 0.25


	
int main()
{
	double tax = 0.0;
	double salay = 0.0;
	double work_hour = 0.0;
	double post_tax_salay = 0.0;
	printf("please enter your work hours:");
	scanf("%lf", &work_hour);

	if(work_hour > BASE_WORK_HOUR)
	{
		salay = BASE_WORK_HOUR * BASE_SALARY;
		salay += (work_hour - BASE_SALARY) * OVER_TIME_SALARY; 
	}else{
		salay = BASE_SALARY * work_hour;
	}



	if(salay < TAX_SUM_1){
		tax = salay * TAX_RATIO_1;
	}else if(salay < TAX_SUM_2){
		tax = TAX_1 + (salay - TAX_SUM_1) * TAX_RATIO_2;
	}else{
		tax = TAX_2 + (salay - TAX_SUM_2) * TAX_RATIO_3; 
	}

	post_tax_salay = salay - tax;
	printf("salay = %f,post tax salay = %f,tax = %f\n", salay, post_tax_salay, tax);

	return 0;	
	

}
