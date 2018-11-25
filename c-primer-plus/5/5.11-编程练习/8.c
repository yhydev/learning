#include <stdio.h>


int main()
{
	int moduli,moduli_op;
	printf("this program computes moduli\n");
	printf("Enter an integer to serve as the second operand:");
	scanf("%d", &moduli_op);
	while(printf("Enter next number for first operand (<= 0 to quit):") && scanf("%d", &moduli) && moduli > 0)
	{
		printf("%d %% %d is %d\n", moduli, moduli_op, moduli % moduli_op);
	}
	

	return 0;
}
