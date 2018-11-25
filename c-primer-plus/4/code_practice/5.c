#include <stdio.h>

int main()
{
	float fsize;
	float dspeed = 18.12f;
	
	printf("please enter download file sieze(megabytes):");
	scanf("%f", &fsize);

	printf("At %.2f megabits per second,a file of %.2f megabytes\n\
downloads in %.2f seconds.\n", dspeed, fsize, fsize * 8 / dspeed);

	

	
	return 0;
}
