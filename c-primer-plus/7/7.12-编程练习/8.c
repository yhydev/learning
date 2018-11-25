#include <stdio.h>

//#define BASE_SALARY  1000.00
#define BASE_WORK_HOUR  40
#define OVER_TIME_SALARY_RATIO 1.5

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
	int select_salay;
	int select_index;
	double work_salay_1 = 8.75, work_salay_2 = 9.33, work_salay_3 = 10.00, work_salay_4 = 11.20;
	while(1){

		//输出菜单
		printf("**********************************************************************\n\
Enter the number corresponding to the desired pay rate or action:\n\
1)$%.2lf\\hr\t\
2)$%.2lf\\hr\n\
3)$%.2lf\\hr\t\
4)$%.2lf\\hr\n\
5)quit\n\
*********************************************************************\n",work_salay_1, work_salay_2, work_salay_3, work_salay_4);
			
		//处理输入
		scanf("%d", &select_index);

		if(select_index == 5)
			break;

		switch(select_index){
			case 1:select_salay = work_salay_1;
				break;
			case 2:select_salay = work_salay_2;
				break;
			case 3:select_salay = work_salay_3;
				break;
			case 4: select_salay = work_salay_4;
				break;
			default:
				printf("input error!!\n");
		}
	
	

		printf("please enter your work hours:");
		scanf("%lf", &work_hour);

		//超时薪资
		if(work_hour > BASE_WORK_HOUR){
			salay = BASE_WORK_HOUR * select_salay;
			salay += (work_hour - BASE_WORK_HOUR) * OVER_TIME_SALARY_RATIO * select_salay; 
		}else{//正常薪资
			salay =  work_hour * select_salay;
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

		



		
	}


	return 0;	
	

}
