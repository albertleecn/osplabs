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


