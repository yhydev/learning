#include <stdio.h>

#define GAL 3.785
#define MILE 1.609

int main(void)
{
	float mile,gal;
	printf("请输入你的行使距离(英里)和耗油量(加仑)：");
	scanf("%f %f", &mile, &gal);
	
	printf("每加仑行使%.1f英里\n", mile / gal);
	

	printf("每升行使%.1f百公里\n", (mile * MILE) / (gal * GAL)  / 100);

	return 0;
}
