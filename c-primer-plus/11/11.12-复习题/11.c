#include <stdio.h>
#include <string.h>
char * s_gets2(char *,int);
int main(void){
	
	const int size = 10;
	char ipt[size];

	s_gets2(ipt, size);


	fputs(ipt, stdout);


	return 0;
}



char * s_gets2(char *st, int n){
	char * ret_val;
	ret_val = fgets(st, n, stdin);
	char * findp;
	if(ret_val){
//		while(*st != '\0' && *st != '\n')
//			st++;

		findp = strchr(st, '\n');
		if(findp != NULL)
			*findp = '\0';	
		else			
			while(getchar() != '\n')
				continue;
			
		
	}

	return ret_val;
}

