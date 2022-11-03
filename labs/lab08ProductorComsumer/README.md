# Write a c program to implement product and consumer problem using multi-threads

## Target
1. Write a c/c++ program
2. To implement product and consumer problem using multi-threads
3. GCC

## Tools

### Install GCC Software Collection
```
sudo apt-get install build-essential
```
### How to use GCC
* [gcc and make](https://www3.ntu.edu.sg/home/ehchua/programming/cpp/gcc_make.html)

### Posix thread
```
#include <pthread.h>
pthread_create()
```

### Posix mutex互斥量
```
#include <pthread.h>
pthread_mutex_t mutex =PTHREAD_MUTEX_INITIALIZER;
int pthread_mutex_init(pthread_mutex_t *restrict mutex,
                       const pthread_mutexattr_t *restrict attr);
int pthread_mutex_destroy(pthread_mutex_t *mutex);
int pthread_mutex_lock(pthread_mutex_t *mutex);
int pthread_mutex_trylock(pthread_mutex_t *mutex);
int pthread_mutex_unlock(pthread_mutex_t *mutex);
```
实例:
```
pthread_mutex_t mutex;

void * thread_run(void *arg)
{
    pthread_mutex_lock(&mutex);
    //////TODO
    XXXXXXXXX

    pthread_mutex_unlock(&mutex);
    return 0;
}

int main(int argc, char *argv[])
{
    pthread_t thread1, thread2;
    pthread_mutex_init(&mutex, 0);
    pthread_create(&thread1, NULL, thread_run, 0);
    pthread_create(&thread2, NULL, thread_run, 0);
    pthread_join(thread1, 0);
    pthread_join(thread2, 0);
    pthread_mutex_destroy(&amp;mutex);
    return 0;
}
```


### get the total time of program execution
```
$ time tar xvJf linux-5.14.14.tar.xz 

real	0m28.554s
user	0m7.738s
sys	0m3.554s
```

## How to do

write a c program to implement product and consumer problem using multi-threads

实现I个生产者J个消费者问题，其中共享缓冲区的大小为N，所有生产者共生产K(K>N)个产品后结束，所有消费者共消费K个产品后结束。

具体要求
* 严格按时序输出每个生产者、消费者的行为，其中包括生产产品k、消费产品k、进入临界区、存入产品、取出产品、离开临界区；
* 需要考虑边界（某生产者生产第K个产品后所有生产者结束；某消费者消费第K个产品后所有消费者结束）
* 需要考虑随机函数，生产者生产时需要一个随机时间；消费者消费时也需要一个随机时间；
* 编号：无论生产者还是消费者都需要有编号；产品同样也需要编号；缓冲区的各个产品项也需要有编号；
* 输出形式可以采用标准输出、图形动态显示及同时文字记录输出等方式，无论是生产者还是消费者，其主要输出内容如下：
  a)	进入临界区前，输出某某编号（生产者/消费者）线程准备进入临界区
  b)	进入临界区后，输出某某编号（生产者/消费者）线程已进入临界区
  c)	离开临界区后，输出某某编号（生产者/消费者）线程已离开临界区
  d)	生产者生产一个产品时，需要输出产品信息；
  e)	生产者将产品放入缓冲区时，需要输出相关信息；
  f)	消费者将产品从缓冲区取出时，需要输出相关信息；
  g)	消费者消费一个产品时，需要输出产品信息；
* 不能出现竞态
* 不能出现忙等待

详细见PDF附件。

