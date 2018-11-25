#include <stdio.h>
#include <string.h>
int main(void)
{

	char lname[10];
	char fname[10];
	int llen,flen;

	printf("enter your last name:\n");
	scanf("%s", lname);
	printf("enter your first name:\n");
	scanf("%s", fname);

	llen = strlen(lname);
	flen = strlen(fname);
	

	printf("%s %s\n", lname, fname);
	printf("%*d %*d\n",llen / 2,llen,(flen+llen)/2,flen);
	
	printf("%s %s\n", lname, fname);
	printf("%-*d %-*d\n", llen, llen, flen, flen);

	return 0;
}
