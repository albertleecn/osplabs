the client program
===
Source Code
---
#include <sys/syscall.h>
#include <sys/types.h>
#include <stdio.h>
#define __NR_schello 385
int main(int argc, char *argv[])
{
syscall(__NR_schello);
printf("ok! run dmesg | grep hello in terminal!\n");
return 0;
}

Execute
---
gcc -o testschello testschello.c
./testschello
dmesg | grep schello
