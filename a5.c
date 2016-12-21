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
	unsigned short flags;
	int result = addsub(operand1, operand2, what, &flags);
	
	printf("Ergebnis und Operanden signed:\n");
	printf("%d %c %d = %d\t",(signed short)operand1,what,(signed short)operand2,(signed short)result);
	if ((flags >> 11)&1) {
		printf("(Ergebnis ist falsch!)\n");
	}		
	else{		
		printf("(Ergebnis ist richtig!)\n");
	}
	
	printf("Ergebnis und Operanden unsigned:\n");
	
	printf("%d %c %d = %d\t",(unsigned short)operand1,what,(unsigned short)operand2,(unsigned short)result);
	
	if (flags &1) {
		printf("(Ergebnis ist falsch!)\n");
	}		
	else{		
		printf("(Ergebnis ist richtig!)\n");
	}
	
	return 0;
}
