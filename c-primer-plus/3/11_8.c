#include <stdio.h>

int main(void)
{
	
	float bei;
	printf("请输入杯数(US单位):");
	scanf("%f", &bei);
	
	printf("%f 杯有 %f 品脱\n", bei, bei / 2);
	
	printf("%f 杯有 %f 盎司\n", bei, bei * 8);
	printf("%f 杯有 %f 汤勺\n", bei, bei * 8 * 2);
	printf("%f 杯有 %f 茶勺\n", bei, bei * 8 * 2 * 3);

	return 0;


}
