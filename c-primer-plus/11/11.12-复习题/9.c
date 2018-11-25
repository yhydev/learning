#include <stdio.h>
#include <string.h>
char * s_gets(char *,int);
char * s_gets2(char *,int);
int main(void){
	
	const int size = 10;
	char ipt[size];

	s_gets2(ipt, size);


	fputs(ipt, stdout);

	s_gets(ipt, size);

	fputs(ipt, stdout);

	return 0;
}



char * s_gets2(char *st, int n){
	char * ret_val;
	ret_val = fgets(st, n, stdin);

	if(ret_val){
		while(*st != '\0' && *st != '\n')
			st++;
		if(*st == '\n')
			*st = '\0';	
		else			
			while(getchar() != '\n')
				continue;
			
		
	}

	return ret_val;
}

char * s_gets(char *st, int n){
	char * ret_val;
	int i = 0;
	ret_val = fgets(st, n, stdin);
	if(ret_val){
		while(st[i] != '\n' && st[i] != '\0')
			i++;
		if(st[i] == '\n')
			st[i] = '\0';
		else
			while(getchar() != '\n')
				continue;
	}

	return ret_val;

}
