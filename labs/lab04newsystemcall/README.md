the client program
===
Source Code
---
#include <sys/syscall.h> \<br>
#include <sys/types.h> \<br>
#include <stdio.h> \<br>
#define __NR_schello 385 \<br>
int main(int argc, char *argv[]) \<br>
{ \<br>
syscall(__NR_schello); \<br>
printf("ok! run dmesg | grep hello in terminal!\n"); \<br>
return 0; \<br>
} \<br>

Execute
---
gcc -o testschello testschello.c
./testschello
dmesg | grep schello
