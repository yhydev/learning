#include <stdio.h>

int main(void)
{

	float height;
	char name[20];

	printf("please enter your hieight(cm) and name:");
	scanf("%f %s", &height, name);
	printf("%s,you are %.2f feet tall\n", name, height/10);

	return 0;
}
