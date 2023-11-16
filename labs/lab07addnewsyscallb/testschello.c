#include <unistd.h>
#include <sys/syscall.h>
#include <sys/types.h>
#include <stdio.h>
#define _NR_schello 335
int main(int argc, char *argv[])
{
 syscall(_NR_schello);
 printf("ok! run dmesg | grep hello in terminal!\n");
 return 0;
}
