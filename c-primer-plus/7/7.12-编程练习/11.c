#include <stdio.h>


#define FREIGHT_LEVEL_WEIGHT_1 5
#define FREIGHT_LEVEL_PIRCE_1 6.5

#define FREIGHT_LEVEL_WEIGHT_2 20
#define FREIGHT_LEVEL_PIRCE_2 14 + FREIGHT_LEVEL_PIRCE_1

#define OVER_WEIGHT 0.5


int main(){
	
	char goods_1[10] = "洋蓟", goods_2[10] = "甜菜", goods_3[10] = "胡萝卜";

	const float sale = 0.95;
	const float sale_pirce = 100;

	float sum_weight = 0;
	float weight = 0;
	float freight = 0;
	float sum_pirce = 0;


	char select_goods;
	char select_index;

	float goods_pirces[3] = {2.05, 1.15, 1.09};
	float pirces[3] = {0,0,0};
	float weights[3] = {0,0,0};




append:printf("-----------------------\n"
			"a)%10s  $%6.2f\n"
			"b)%10s  $%6.2f\n"
			"c)%10s  $%6.2f\n"
			"q)退出订购\n"
			"----------------------\n",
		goods_1, goods_pirces[0], goods_2, goods_pirces[1], goods_3, goods_pirces[2]);

	while((select_goods = getchar()) != 'q'){
		

		//价格追加
		switch(select_goods){
			case 'a': select_index = 0;
				break;
			case 'b': select_index = 1;
				break;
			case 'c': select_index = 2;
				break;
			default:
				goto append;
		}	


		printf("Enter buy weight:");
		scanf("%f", &weight);

		//重量、价格追加
		weights[select_index] += weight;
		pirces[select_index] += goods_pirces[select_index] * weight;

		goto append;
	}

	for(select_index = 0;select_index < 3;select_index++){
		sum_weight += weights[select_index];
		sum_pirce += pirces[select_index];
	}


	//运费计算

	if(sum_weight <= FREIGHT_LEVEL_WEIGHT_1){
		freight = FREIGHT_LEVEL_PIRCE_1;
	}else if(sum_weight <= FREIGHT_LEVEL_WEIGHT_2){
		freight = FREIGHT_LEVEL_PIRCE_2;
	}else{
		freight = OVER_WEIGHT * (sum_weight - FREIGHT_LEVEL_WEIGHT_2) + FREIGHT_LEVEL_PIRCE_2;
	}

	printf("goods\n"	
	"-----------------------------------------\n"
	"%6s %6.2f/lb %6.2f %6.2f\n"
	"%6s %6.2f/lb %6.2f %6.2f\n"
	"%6s %6.2f/lb %6.2f %6.2f\n"
	"总价:\t$%.2f\n"
	"运费:\t$%.2f\n",
	goods_1, weights[0], goods_pirces[0], pirces[0],
	goods_2, weights[1], goods_pirces[1], pirces[1],
	goods_3, weights[2], goods_pirces[2], pirces[2],
	sum_pirce, freight 
	);

	if(sum_pirce >= 100)
		printf("折扣价:\t%.2f\n", sum_pirce * sale);
	

	return 0;
}
