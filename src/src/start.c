#include "init.h"
#include "string.h"

extern unsigned int DATA_LMA,DATA_VMA,DATA_SIZE;
extern unsigned int BSS_LMA,BSS_SIZE;
extern unsigned int VBR_Address;

static void regcpy(unsigned * restrict l, int s, unsigned * restrict r) {
	while(s > 0)
	{
		*r++ = *l++;
		*r++ = *l++;
		*r++ = *l++;
		*r++ = *l++;
		s -= 16;
	}
}
static void regclr(unsigned *r, int s) {
	while(s > 0)
	{
		*r++ = 0;
		*r++ = 0;
		*r++ = 0;
		*r++ = 0;
		s -= 16;
	}
}


__attribute__((section(".text.entry")))
int start(void){
	Init_SR_and_Stack();
	regcpy(&DATA_LMA,  (int)&DATA_SIZE,  &DATA_VMA);
	regclr(&BSS_LMA, (int)&BSS_SIZE);
	__asm__ volatile ("ldc	%0, vbr\n"::"r"((unsigned)&VBR_Address));
	while (1){__asm__ volatile ("sleep\n");}
}
