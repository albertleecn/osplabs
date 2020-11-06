# Write a c/c++ program to implement the producer-consumer problem

## Target
1. Write a c/c++ program

2. To implement the producer-consumer problem

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

write a c program to implement the producer-consumer problem, which has 5 producers and 4 consumers, and the size of shared pool is 3, a total of 15 products were produced and consumed, and all producers and consumers will exit. 
### The specific requirements are as follows

* 每个产品的数据结构：至少包含产品编号、生产者编号、生产时间、缓冲区中存储编号、消费者编号；
* 生产和消费都需要随机时间(1~5s)；
* 不能产生竞态、不能死锁；
* 对公共缓冲区的操作：操作前、操作后要显示公共缓冲区中各个产品项的状态


### Example of multi-threads

```
#include<stdio.h>
#include <pthread.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>

#define MAX_THEADS 5

/*thread's args*/
typedef struct ST_ARGS
{
    int id;
    char name[32];
}ARGS;

/*thread business*/
void *ThreadFunc(void *args)
{
    ARGS* pArgs=(ARGS*)args;
    usleep(1000+rand()%1000);
    printf ("thread id = %d\n", pArgs->id);
    usleep(1000+rand()%1000);
    printf ("thread id = %d,%ld again\n", pArgs->id,pthread_self());
}

int main(void)
{
    int     i=0;
    pthread_t tid[MAX_THEADS];
    ARGS    myArgs[MAX_THEADS];
    int     err;

    /*random seed initial*/
    srand((unsigned)time(NULL));

    /*create threads*/
    while (i<MAX_THEADS)
    {
        myArgs[i].id=i;
        err= pthread_create(&tid[i], NULL, ThreadFunc, &myArgs[i]);
        if(err != 0){
            printf("can't create thread: %s\n",strerror(err));
            break;
        }else
        {
            printf("create thread(%ld,%d)\n",tid[i],myArgs[i].id);
        }
        i++; 
        usleep(100);
    }

    /*main thread should wait other threads */
    for (i=0;i<MAX_THEADS;i++)
    {
        pthread_join(tid[i],NULL);
    }

    return 0;
}


```

```
$gcc pthread_test.c  -o pthread_test  -lpthread
$./pthread_test
create thread(140286004549376,0)
create thread(140285996156672,1)
create thread(140285987763968,2)
create thread(140285979371264,3)
create thread(140285970978560,4)
thread id = 0
thread id = 1
thread id = 0,140286004549376 again
thread id = 2
thread id = 1,140285996156672 again
thread id = 3
thread id = 3,140285979371264 again
thread id = 2,140285987763968 again
thread id = 4
thread id = 4,140285970978560 again
$
```


