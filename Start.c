#include "string.h"

extern unsigned int
VBR_ADDRESS,
EXH_ADDRESS_BEGIN,EXH_SIZE,
TLBH_ADDRESS_BEGIN,TLBH_SIZE,
INTH_ADDRESS_BEGIN,INTH_SIZE,
BSS_LMA,BSS_SIZE,
DATA_LMA,DATA_VMA,DATA_SIZE;

int start(){
	memset(&BSS_LMA,0,(unsigned int)&BSS_SIZE);
	memset((void*)0x8c002000,0,396*224*4);
	memcpy(&DATA_VMA,&DATA_LMA,(unsigned int)&DATA_SIZE);
	memcpy((void*)0x8c000100,&EXH_ADDRESS_BEGIN,(unsigned int)&EXH_SIZE);
	memcpy((void*)0x8c000400,&TLBH_ADDRESS_BEGIN,(unsigned int)&TLBH_SIZE);
	memcpy((void*)0x8c000600,&INTH_ADDRESS_BEGIN,(unsigned int)&INTH_SIZE);

	__asm__ volatile("ldc	%0, vbr"::"r"((unsigned int)0x8c000000));

	while (1){
		__asm__ volatile("sleep\n");
	}
}
