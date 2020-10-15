# Write a c/c++ program to implement copy one file

## Target
1. Write a c/c++ program

2. To implement copy one file

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

## How to do

write a c program to implement copy one file, and the program also verifies the result

### 1. Example

```
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, char* argv[]){
	int infd, outfd;
	char buffer[BUF_SIZE];
	int i;
	
	if ((infd=open(argv[1],O_RDONLY))<0){
		exit(2);	
	}

	if ((outfd=open(argv[2],O_WRONLY|O_CREAT|O_EXCL,S_IRUSR|S_IWUSR))<0){
		exit(3);	
	}

	while(1){
		i=read(infd,buffer,BUF_SIZE);
		if (i<=0) break;
		write(outfd,buffer,i);
	}

	close(outfd);
	close(infd);

	exit(0);
}
```

### 2. compile the source code and run

```
gcc -o mycopy  mycopy.c
./mycopy  fileA fileB
md5sum fileA fileB
```

### 3. targets

1. copy any file
2. support to verify with md5 or other hash