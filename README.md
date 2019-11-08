# OSP 2019 Fall
operating system principles and labs
## labs of OSP 2019 Fall
[Please read the letter firstly:LINUX is obsolete](/doc/LINUXisobsolete.pdf)
## lab01
install CentOS 8 in Virtual Machine
## lab02
download linux kernel source code and compile it in CentOS 8
## lab03
how to minimize the linux kernel for CentOS 8
## lab04
add new system service into linux kernel
## lab05
add new system service with arguments and return result to app
## lab06
write a c program to implement copy one file and verify it
## lab07
write a c program to implement copy one directory ant it's subdiectory, the program also verifies the result


md5:

```
gcc -lcrypto
int main()
{
    MD5_CTX ctx;
    unsigned char outmd[16];
    int i=0;

    memset(outmd,0,sizeof(outmd));
    MD5_Init(&ctx);
    MD5_Update(&ctx,"hel",3);
    MD5_Update(&ctx,"lo\n",3);
    MD5_Final(outmd,&ctx);
    for(i=0;i<16;i++)
    {
        printf("%02X",outmd[i]);
    }
    printf("\n");
    return 0;
}
```
## lab08
write a c program to implement product and comsumer problem which is described by textbook
## lab09
write a c program to implement minishell
## more
coming soon
![UNIX操作系统有感](/img/unix_poem.png)
