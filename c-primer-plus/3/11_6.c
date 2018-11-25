#include <stdio.h>

int main(void)
{
	unsigned int kk;
	printf("输入夸脱数: ");
	scanf("%u", &kk);
	printf("\n%u 夸克有 %e 水分子\n", kk, (kk * 950) / (3.0 * 1e-23));
	return 0;


}
