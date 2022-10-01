# Write a c/c++ program to implement copy one diretory

## Target
1. Write a c/c++ program

2. To implement copy one diretory and it's subdiretories with multi-threads

3. GCC

4. Test directory:
   1. extract linux-5.14.14.tar.xz to linux-5.14.14 directory, 
   2. and copy linux-5.14.14 directory to linux-5.14.14bak directory

5. Verify that the directory copy is correct

6. Compare the advantages and disadvantages of two different solutions: multi-process and multi-threaded

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

### get the total time of program execution
```
$ time pwd
/mnt/test2linux

real	0m0.000s
user	0m0.000s
sys	0m0.000s


$ time tar xvJf linux-5.14.14.tar.xz 

real	0m28.554s
user	0m7.738s
sys	0m3.554s
```

## How to do

write a c program to implement copy one diretory and it's subdiretories, and the program also verifies the result

### 1. Example of traverse one directory

```
#include <dirent.h>
#include <unistd.h>
#include <stdlib.h>

int main()
{
    DIR * dir;
    struct dirent * ptr;
	/*open dir*/
    dir = opendir("/home");
	/*read dir entry*/
    while((ptr = readdir(dir)) != NULL)
    {
        printf("d_name : %s", ptr->d_name);
		if (ptr->d_type==DT_DIR){
        	printf("\tDir");
		}
        	printf("\n");
    }
	/*close dir*/
    closedir(dir);
	exit(0);
}
```

### 2. Example of multi-threads

```
#include <pthread.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
void *ThreadFunc(void *arg)
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


