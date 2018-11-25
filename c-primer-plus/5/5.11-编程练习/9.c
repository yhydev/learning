#include <stdio.h>


void temperatures(double fahrenheit);

int main(void)
{
	double fahrenheit;//输入的华氏度
	

	while(printf("Enter fahreheit(q to exit):") && scanf("%lf", &fahrenheit))
	{
		temperatures(fahrenheit);
	}
		

}

void temperatures(double fahrenheit)
{
	const double S_C = 5.0 / 9.0;
	const double S_C1 = 32.0;

	const double K_C = 273.16;

	double s = S_C * (fahrenheit - S_C1);
	double k = s + K_C;

	printf("Fahreheit\t = %.2lf\n", fahrenheit);
	printf("Celsius\t = %.2lf\n", s);
	printf("Kelvin\t = %.2lf\n", k);
}

