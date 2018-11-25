#include <stdio.h>
#include <inttypes.h>

#define PRID32 "d"

int main(void)
{
	int32_t me32;
	me32 = 45933945;
	printf("First, assume int32_t is int: ");
	printf("me32 = %d\n", me32);
	printf("Next, let's not make any assumptions.\n");
	printf("Instead, Use a \"macro\" from inttypes.h:");
	printf("me32 = %" PRID32 "\n", me32);
	return 0;
 
}
