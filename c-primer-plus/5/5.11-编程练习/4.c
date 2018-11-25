#include <stdio.h>


int main(void)
{
	float height;
	int ft;
        float in;

	printf("enter a height in centimeters:\t");

	while(scanf("%f", &height) && height > 0 ){
		in = height / 2.54;
		ft = in / 12;
		printf("%.1f cm = %d feet, %.1f inches\n", height, ft, in - ft * 12);//, height / 30.48, height / 30.48);

		
		printf("enter a height in centimeters (<=0 to quit):\t");
	}

	return 0;
}
