#include <stdio.h>
#include <float.h>

int main(void)
{
	float f = 1.0 / 3.0;
	double d = 1.0 / 3.0;

	printf("float 1.0 / 3.0 = %.6f\n", f);
	printf("double 1.0 / 3.0 = %.6f\n", d);
	printf("float 1.0 / 3.0 = %.8f\n", f);
	printf("double 1.0 / 3.0 = %.8f\n", d);
	printf("float 1.0 / 3.0 = %.16f\n", f);
	printf("double 1.0 / 3.0 = %.16f\n", d);
	
	printf("FLT_DIG = %f\n", FLT_DIG);
	printf("DBL_DIG = %f\n", DBL_DIG);

	return 0;
}
