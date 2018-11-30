CC      := gcc -pipe
AS      := as
AR      := ar
LD      := ld
OBJCOPY := objcopy
OBJDUMP := objdump
NM      := nm
LDFLAGS := -m elf_i386
TOP = .
CFLAGS := $(CFLAGS) -nostdinc -m32 -Os -fno-builtin -I$(TOP)
CFLAGS += -fno-tree-ch -fno-stack-protector -gstabs 
CFLAGS += -Wall -Wno-unused -Werror -Wno-format 


all: image

boot_objs := boot.o main.o

boot.o:	boot.S
	$(CC) $(CFLAGS) -c -o $@ $<
#	$(CC) -nostdinc -m32 -Os -c -o $@ $<

main.o: main.c
	$(CC) $(CFLAGS) -c -o $@ $<
#	$(CC) -nostdinc -m32 -Os -c -o $@ $<

boot: $(boot_objs)
	$(LD) $(LDFLAGS) -N -e start -Ttext 0x7C00 -o $@.out $^
	$(OBJDUMP) -S $@.out >$@.asm
	$(OBJCOPY) -S -O binary -j .text $@.out $@
	#$(OBJCOPY) -S -O binary -j .text -j .data $@.out $@
	perl sign.pl $@

kern/kernel:kern/entry.o kern/entrypgdir.o kern/init.o kern/console.o kern/printf.o lib/printfmt.o lib/string.o
	$(LD) -o kern/kernel -m elf_i386 -T kern/kernel.ld -nostdlib kern/entry.o kern/entrypgdir.o kern/init.o kern/console.o kern/printf.o lib/printfmt.o lib/string.o /usr/lib/gcc/i686-linux-gnu/5/libgcc.a -b binary 

kern/entry.o:kern/entry.S
	$(CC) $(CFLAGS) -c -o $@ $<

kern/entrypgdir.o:kern/entrypgdir.c
	$(CC) $(CFLAGS) -c -o $@ $<

kern/init.o:kern/init.c
	$(CC) $(CFLAGS) -c -o $@ $<

kern/console.o:kern/console.c
	$(CC) $(CFLAGS) -c -o $@ $<

kern/printf.o:kern/printf.c
	$(CC) $(CFLAGS) -c -o $@ $<

lib/printfmt.o:lib/printfmt.c
	$(CC) $(CFLAGS) -c -o $@ $<

lib/string.o:lib/string.c
	$(CC) $(CFLAGS) -c -o $@ $<

image: boot kern/kernel
	dd if=/dev/zero of=./.bochs.img~ count=10000 2>/dev/null
	dd if=./boot of=./.bochs.img~ conv=notrunc 2>/dev/null
	dd if=./kern/kernel of=./.bochs.img~ seek=1 conv=notrunc 2>/dev/null
	mv ./.bochs.img~ ./bochs.img

bochs: 	image
	bochs -f bochsrc.txt

run:	bochs

# For deleting the build
clean:
	rm *.o *.out *.asm boot *.log  .*~ -fr
	rm -fr kern/kernel kern/*.o
	rm -fr lib/*.o
	rm bochs.img -fr

tar:clean
	bash tar.sh

.PHONY:	clean
