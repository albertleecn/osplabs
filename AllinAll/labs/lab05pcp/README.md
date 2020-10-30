# Write a c/c++ program to implement copy one diretory

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


