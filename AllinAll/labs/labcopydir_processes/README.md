# Write a c/c++ program to implement copy one directory using multi-processes

## Target
1. Write a c/c++ program
2. To implement copy one directory and it's subdiretories with multi-processes
3. GCC
4. Test directory:
   1. extract linux-5.14.14.tar.xz to linux-5.14.14 directory, 
   2. and copy linux-5.14.14 directory to linux-5.14.14bak directory
5. Verify that the directory copy is correct

## Tools

### Install GCC Software Collection
```
sudo apt-get install build-essential
```
### How to use GCC
* [gcc and make](https://www3.ntu.edu.sg/home/ehchua/programming/cpp/gcc_make.html)

### md5
```
md5sum fileA fileB
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

### create process and execute one program
fork(): clone a new instance of current process
```
#include <sys/types.h>
#include <unistd.h>

pid_t fork(void);
```

exec(): 
```
#include <unistd.h>

int execl(const char *path, const char *arg, ...);  
int execlp(const char *file, const char *arg, ...);  
int execle(const char *path, const char *arg, ..., char *const envp[]);  
int execv(const char *path, char *const argv[]);  
int execvp(const char *file, char *const argv[]);  
int execve(const char *path, char *const argv[], char *const envp[]);  
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


## How to do

write a c program to implement copy one diretory and it's subdiretories, and the program also verifies the result

### 1. Example of multi-processes

```
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

int main(int argc, char *argv[])
{
	pid_t pid[2];
	int cnt = 0;

	/* fork the first child process */
	pid[0] = fork();
	if (pid[0] < 0) {	/* error occurred */
		fprintf(stderr, "InParent: :Fork Failed");
		exit(-1);
	} else if (pid[0] == 0) {	/* child process */
		execlp("/bin/ls", "ls", "-l", NULL);
	};

	/*parent process */
	cnt++;
	printf("In Parent: Create child[%d]\n", cnt);

	/* fork the second child process */
	pid[1] = fork();
	if (pid[1] < 0) {	/* error occurred */
		fprintf(stderr, "InParent: :Fork Failed");
		exit(-1);
	} else if (pid[1] == 0) {	/* child process */
		execlp("/bin/date", "date", "+\"%y-%m-%d %H:%M:%S\"", NULL);
	};

	/*parent process */
	cnt++;
	printf("In Parent: Create child[%d]\n", cnt);

	/* parent process */
	/* parent will wait for the child to complete */
	while (cnt--) {
		printf("In parent: Waiting the child %d\n", cnt);
		wait(NULL);
	}
	printf("In Parent: All Children Complete!\n");

	exit(0);
}
```

Compiling:
```
gcc     multiprocessdemo.c   -o mpdemo
./mpdemo
```

Result:
```
In Parent: Create child[1]
In Parent: Create child[2]
In parent: Waiting the child 1
total 32
"21-11-05 16:50:08"
In parent: Waiting the child 0
-rw-rw-r-- 1 test test   225 11月  5 16:46 Makefile
-rwxrwxr-x 1 test test 17008 11月  5 16:50 mpdemo
-rw-rw-r-- 1 test test  1052 11月  5 16:47 multiprocessdemo.c
In Parent: All Children Complete!```
```

### 2. Example of traverse one directory

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

Compiling:
```
gcc     listdir.c   -o listdir
./listdir
```

