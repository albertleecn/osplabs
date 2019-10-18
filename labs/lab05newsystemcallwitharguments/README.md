the client program v2
===
Source Code:testschello.c
---
        #include <unistd.h>
        #include <sys/syscall.h>
        #include <sys/types.h>
        #include <stdio.h>
        #define __NR_alcall     336
        long alcall(int cmd, char* buf){
                return syscall(__NR_alcall,cmd,buf);
        }
        int main(int argc, char *argv[])
        {
                int cmd;
                char buf[256];
                cmd=9;
                alcall(cmd,buf);
                printf("ok! run dmesg | grep alcall in terminal!\n");
                return 0;
        }
