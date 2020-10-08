# Write a c/c++ program to implement copy one file

## Target
1. Write a c/c++ program

2. To implement copy one file

3. Gcc

## Tools

### GCC
GCC
```
sudo apt-get install build-essential
```


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
