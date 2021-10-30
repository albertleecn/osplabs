# Customize and minimize the latest linux kernel

## Target
1. config the latest linux kernel

2. compile the latest linux kernel

3. boot ubuntu with the latest linux kernel

## preparations

this lab is based on the previous lab:
[Download and compile the latest linux kernel](/AllinAll/labs/labcompilelinux)

## How to do

Download and compile the latest linux kernel
### the latest linux kernel
Linux Stable Kernel: 5.14.14  (2021.10.26)

### 1. backup the current config file

```
cd /usr/src/linux
```

```
cp .config   .config.backup1
```

### 2. clear the previous compile settings

clean all:

```
make mrproper
```

copy the previous config file to the current config:

```
cp .config.backup1 .config 
```

### 3. re-config the latest linux kernel

```
make gconfig
```

### 4. customized config

#### 4.1. Customize and Minimize the latest linux kernel

##### 4.1.1 Remove drivers' modules that do not have devices on this computer

##### 4.1.2 Remove infrequent file system drivers 

don't remove ext2 and ext4 driver

#### 4.2. if some errors happen, please go back the 2th step

go back the 2th step

### (optional)5. clean the previous compilings

If you want to recompile , please execute the following command to clean the previous work:
 
```
make clean
```

### 6. compile the latest linux kernel (long wait)

compile the latest linux kernel

```
make -j4
```

install the latest linux kernel
```
sudo make modules_install
sudo make install
```

### 7. boot ubuntu with the latest linux kernel

```
sudo reboot
```

```
uname -a
```

Compare the sizes of different linux kernel:

```
ls -l /boot
```

Is the size of the latest kernel the smallest? 
If not, please go back the 2th step.

End.
