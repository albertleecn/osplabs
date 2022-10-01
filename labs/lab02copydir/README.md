# Write a c/c++ program to implement copy one directory

## Target
1. Write a c/c++ program
2. To implement copy one directory and it's subdiretories 
3. GCC
4. IDE 集成开发环境
5. Test directory: (从www.kernel.org下载最新的linux内核linux-5.19.10.tar.xz)
   1. https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.19.10.tar.xz
   1. extract linux-5.19.10.tar.xz to linux-5.19.10 directory, 
   2. and copy  linux-5.19.10 directory to  linux-5.19.10bak directory
6. Verify that the directory copy is correct

## Tools

### Install GCC Software Collection
```
sudo apt-get install build-essential
```
### How to use GCC
* [gcc and make](https://www3.ntu.edu.sg/home/ehchua/programming/cpp/gcc_make.html)

### IDE
1. (推荐)Code::Blocks
```
sudo apt-get install codeblocks
```
2. (试用版或购买激活码)JetBrains CLion
```
sudo snap install clion --classic
```

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


$ time tar xvJf  linux-5.19.10.tar.xz 

real	0m28.554s
user	0m7.738s
sys	0m3.554s
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

the value returned in d_type:
              DT_BLK      This is a block device.
              DT_CHR      This is a character device.
              DT_DIR      This is a directory.
              DT_FIFO     This is a named pipe (FIFO).
              DT_LNK      This is a symbolic link.
              DT_REG      This is a regular file.
              DT_SOCK     This is a UNIX domain socket.
              DT_UNKNOWN  The file type could not be determined.

opendir()
readdir()
closedir()

```

### Create a symbol link file
```
#include <fcntl.h>           /* Definition of AT_* constants */
#include <unistd.h>
int link(const char *oldpath, const char *newpath);
```



## How to do

write a c program to implement copy one directory and it's subdirectories, and the program also verifies the result

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

Compiling:
```
gcc     listdir.c   -o listdir
./listdir
```

