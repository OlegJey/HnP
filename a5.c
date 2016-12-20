#include <stdio.h>

extern int addsub(int, int, char, unsigned short*);


int main(int argc, char **argv){

	if(argc != 4){
		printf("Parameter stimmen nicht!\n");
		return 0;
	}
	
	int operand1 = atoi(argv[1]);
	int operand2 = atoi(argv[3]);
	char what = argv[2][0];
	unsigned short *flags;
	int result = addsub(operand1, operand2, what, flags);
	printf("%d %c %d = %d\n",operand1,what,operand2,result);
	
		


}
