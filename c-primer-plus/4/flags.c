#include <stdio.h>
/*
演示一些格式标记
*/


int main(void)
{
	
	printf("%x %X %#x %#X\n", 21, 21, 21, 21);
	printf("**%d**% d**% d**\n", 42, 42, -42);
	printf("**%5d**%5.3d**%05d**%05.3d**\n", 6, 6, 6, 6);// 05.3d 0 和精度一起出现，则会忽略0
	
	return 0;

}
