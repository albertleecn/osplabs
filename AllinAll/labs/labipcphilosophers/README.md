# Write a c/c++ program to implement copy one diretory

## Target
1. Write a c/c++ program

2. To implement the dining philosophers problem

3. Gcc

## Tools

### Install GCC Software Colletion
```
sudo apt-get install build-essential
```
### How to use GCC
* [gcc and make](https://www3.ntu.edu.sg/home/ehchua/programming/cpp/gcc_make.html)

### posix thread
```
#include <pthread.h>
pthread_create()
```

## How to do

write a c program to implement the dining philosophers problem
### The specific requirements are as follows

* 5 philosophers
* 思考随机时间3~8s
* 就餐随机时间2~10s
* 就餐10次后结束


### Example of multi-threads

```
#include<stdio.h>
#include <pthread.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>

typedef struct ST_ARGS
{
    int id;
    char name[32];
}ARGS;

void *ThreadFunc(void *args)
{
    ARGS* pArgs=(ARGS*)args;
    usleep(1000+rand()%1000);
    printf ("thread id = %d\n", pArgs->id);
}

int main(void)
{
    int     err;
    pthread_t tid;
    int     i=0;
    srand((unsigned)time(NULL));
    while (1)
    {
        i++; 
        if (i>9) break;
        ARGS* pmyargs=(ARGS*)malloc(sizeof(ARGS));
        pmyargs->id=i;
        err= pthread_create(&tid, NULL, ThreadFunc, pmyargs);
        if(err != 0){
            printf("can't create thread: %s\n",strerror(err));
            break;
        }else
        {
            printf("create thread(%ld)\n",tid);
        }
        usleep(2000);
    }
    return 0;
}

```

```
gcc pthread_test.c  -o pthread_test  -lpthread
./pthread_test
```


