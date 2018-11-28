#include <stdio.h>

extern int count; //引用式声明

static int total = 0; // 静态定越，内部链接

void accumulate(int); //函数原型

void accumulate(int k){//k 块级作用域，无链接

	static int subtotal = 0;
	if(k <= 0){
		printf("Loop cycle: %d\n", count);
		printf("subtotal: %d total: %d\n", subtotal, total);
		subtotal = 0;
	}else{
		subtotal += k;
		total +=k;
	}



}
