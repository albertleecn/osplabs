# Install Ubuntu/Linux

## Target
1. Install Ubuntu on VirtualBox

2. Write a ‘hello world’ program with c

## Tools

### VirtualBox
VirtualBox 6.1 

[VirtualBox](https://www.virtualbox.org/)
1. VirtualBox 6.1.38 platform packages
2. VirtualBox 6.1.38 Oracle VM VirtualBox Extension Pack

### Ubuntu
Ubuntu 22.04 LTS 

[Ubuntu] (https://ubuntu.com/download/desktop)

[Ubuntu] (https://ubuntu.com/download/desktop/thank-you?version=22.04.1&architecture=amd64)

## How to do

### 0. Download and verify the ISO: ubuntu-22.04.1-desktop-amd64.iso
```
$ sha256sum.exe ubuntu-22.04.1-desktop-amd64.iso
c396e956a9f52c418397867d1ea5c0cf1a99a49dcf648b086d2fb762330cc88d *ubuntu-22.04.1-desktop-amd64.iso
$ md5sum.exe ubuntu-22.04.1-desktop-amd64.iso
8c651682056205967d530697c98d98c3 *ubuntu-22.04.1-desktop-amd64.iso
$
```

### 1. Create a virtual machine
Virtual Disk: >=60GB

### 2. Install Ubuntu
UserName: Your Name + Your Student ID

### 3. Post-Install Ubuntu

3.1 Update the Ubuntu online
```
sudo apt-get update
sudo apt-get upgrade
```
3.2 Insert Guest Addtional CD Image to install enhanced drivers for Guest Ubuntu
```
sudo usermod -a -G vboxsf YourUserName
Sudo reboot
```

### 4. Using Ubuntu and Write the first c program on Ubuntu

4.1 Install GCC
```
sudo apt-get install build-essential
```

4.2 Write "Hello world" Program with c : hello.c

Please Hello World, Hello Your Instructor, Hello Yourself

4.3 Compile the program 

```
gcc -o hello  hello.c
```

4.4 Execute the program
```
./hello
```
