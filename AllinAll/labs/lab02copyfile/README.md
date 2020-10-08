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

### 1. write a c program to implement copy one file, and the program also verifies the result

```
gcc -o mycopy  mycopy.c
./mycopy  fileA fileB
md5sum fileA fileB
```
