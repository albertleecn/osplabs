# Install Ubuntu/Linux

## Target
1. Install Ubuntu on VirtualBox

2. Write a ‘hello world’ program with c

## Tools

### VirtualBox
VirtualBox 6.1 (2020.09)

[VirtualBox](https://www.virtualbox.org/)
1. VirtualBox 6.1.14 platform packages
2. VirtualBox 6.1.14 Oracle VM VirtualBox Extension Pack

### Ubuntu
Ubuntu 20.04 LTS (2020.09)

[Ubuntu] (https://ubuntu.com/download/desktop)

[Ubuntu] (https://ubuntu.com/download/desktop/thank-you?version=20.04.1&architecture=amd64)

## How to do

### 0. Download and verify the ISO: ubuntu-20.04.1-desktop-amd64.iso
```
$ sha256sum.exe ubuntu-20.04.1-desktop-amd64.iso
b45165ed3cd437b9ffad02a2aad22a4ddc69162470e2622982889ce5826f6e3d *ubuntu-20.04.1-desktop-amd64.iso
$ md5sum.exe ubuntu-20.04.1-desktop-amd64.iso
77fc715a283e41d0ad33d6418a9ba128 *ubuntu-20.04.1-desktop-amd64.iso
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
gcc -o hello  hello.c

4.4 Execute the program
```
./hello
```
