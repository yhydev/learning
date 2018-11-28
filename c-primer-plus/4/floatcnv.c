#include <stdio.h>
#include <string.h>
/*
不匹配的浮点形转换
*/


int main(void)
{
	
	float n1 = 3.0;
	double n2 = 3.0;
	long n3 = 2000000000;
	long n4 = 1234567890;

//	printf("%.1e %.1e %.1e %.1e \n", n1, n2, n3, n4); // 0.3e1 0.3e1 
//	printf("%ld %ld\n", n3, n4);
	printf("%ld %ld %ld %ld\n", n1, n2, n3, n4);
//	printf("%f %d\n", n1,n1);



	printf("long byte:%ud\ndouble byte:%ud\n",sizeof(long), sizeof(double));
	return 0;

}
