#include <stdio.h>

int main(){

	FILE *fp;
	int content = 0xffff;
	if((fp = fopen("test","w")) != NULL){
		fwrite(&content, sizeof(content),1, fp);
		fclose(fp);
	}

	return 0;

}
