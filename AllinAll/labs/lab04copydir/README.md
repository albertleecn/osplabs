# Write a c/c++ program to implement copy one diretory

## Target
1. Write a c/c++ program

2. To implement copy one diretory and it's subdiretories with multi-threads

3. Gcc

## Tools

### Install GCC Software Colletion
```
sudo apt-get install build-essential
```
### How to use GCC
* [gcc and make](https://www3.ntu.edu.sg/home/ehchua/programming/cpp/gcc_make.html)

### md5
```
md5sum fileA fileB
```

### structure of directory
```
struct dirent
{
    ino_t d_ino; //d_ino 此目录进入点的inode
    ff_t d_off; //d_off 目录文件开头至此目录进入点的位移
    signed short int d_reclen; //d_reclen _name 的长度, 不包含NULL 字符
    unsigned char d_type; //d_type d_name 所指的文件类型 d_name 文件名
    har d_name[256];
};

opendir()
readdir()
closedir()
```

### posix thread
```
#include <pthread.h>
pthread_create()
```

## How to do

write a c program to implement copy one diretory and it's subdiretories, and the program also verifies the result

### 1. Example of traverse one directory

```
#include <sys/types.h>
#include <dirent.h>
#include <unistd.h>
main()
{
    DIR * dir;
    struct dirent * ptr;
    int i;
    dir = opendir("/etc/rc.d");
    while((ptr = readdir(dir)) != NULL)
    {
        printf("d_name : %s\n", ptr->d_name);
    }
    closedir(dir);
}
```

### 2. Example of multi-threads

```
#include <pthread.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
void *ThreadFunc()
{
    static int count = 1;
    printf ("Create thread %d\n", count);
    count++;
}
main(void)
{
    int     err;
    pthread_t tid;
    while (1)
    {
           err= pthread_create(&tid, NULL, ThreadFunc, NULL);
           if(err != 0){
               printf("can't create thread: %s\n",strerror(err));
           break;
           }
          usleep(2000);
    }
}
```

```
gcc pthread_test.c  -o pthread_test  -lpthread
./pthread_test
```


