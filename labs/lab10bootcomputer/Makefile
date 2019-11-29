CC      := gcc -pipe
AS      := as
AR      := ar
LD      := ld
OBJCOPY := objcopy
OBJDUMP := objdump
NM      := nm
LDFLAGS := -m elf_i386

all: image

boot_objs := boot.o

boot.o:	boot.S
	$(CC) -nostdinc -m32 -Os -c -o $@ $<

boot: $(boot_objs)
	$(LD) $(LDFLAGS) -N -e start -Ttext 0x7C00 -o $@.out $^
#	$(OBJDUMP) -S $@.out >$@.asm
	$(OBJCOPY) -S -O binary $@.out $@
	perl sign.pl $@

bochs.img: boot
	dd if=/dev/zero of=./.bochs.img~ count=10000 2>/dev/null
	dd if=./boot of=./.bochs.img~ conv=notrunc 2>/dev/null
	mv ./.bochs.img~ ./bochs.img

image: bochs.img
bochs: image
	bochs -f bochsrc.txt

run: bochs

tar:clean
	bash tar.sh

# For deleting the build
clean:
	rm *.o *.out *.asm boot *.log -fr
	rm bochs.img -fr

.PHONY:	clean
