#ifndef STRING_H
#define STRING_H

void __attribute__((noinline)) *memcpy(void *dest, const void *source, unsigned int n);
void __attribute__((noinline)) *memset(void *dest, int c, unsigned int n);

#endif
