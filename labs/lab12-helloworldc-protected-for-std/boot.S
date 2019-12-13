#include <inc/mmu.h>

.set PROTECT_MODE_CSEG, 0x8         # kernel code segment selector
.set PROTECT_MODE_DSEG, 0x10        # kernel data segment selector
.set CR0_PE_ON,      0x1         # protected mode enable flag

.globl start
start:
  .code16                     # Assemble for 16-bit mode
  cli                         # Disable interrupts
  cld                         # String operations increment

  xorw    %ax,%ax             # Segment number zero
  movw    %ax,%ds             # initiate Data Segment ax->ds
  movw    %ax,%es             # Extra Segment
  movw    %ax,%ss             # Stack Segment

  movw    $0xb800,%ax		#display msg1 directly in read mode
  movw    %ax,%es
  movw    $msg1,%si			#"in real mode  "
  movw    $0xbe2,%di
  movw    $24,%cx
  rep     movsb

  movw    $hellostring,%si
  movw    $0xc04,%di
  movw    $28,%cx
  rep     movsb               # print "hello world" in real mode

seta20.1: # to enable a20
	#read a byte from prort 0x64
  inb     $0x64,%al               # Wait 8042 keyboard for not busy
  testb   $0x2,%al
  jnz     seta20.1

  movb    $0xd1,%al               # 0xd1 -> port 0x64
  outb    %al,$0x64

seta20.2:
  inb     $0x64,%al               # Wait 8042 keyboard for not busy
  testb   $0x2,%al
  jnz     seta20.2

	#enable a20
  movb    $0xdf,%al               # 0xdf -> port 0x60
  outb    %al,$0x60

lgdtload:
  lgdt    gdtdesc
  movl    %cr0, %eax
  orl     $CR0_PE_ON, %eax
  movl    %eax, %cr0
 
  ljmp    $PROTECT_MODE_CSEG, $protcseg

  .code32                     # Assemble for 32-bit mode
####write down your code

###end of your code
 
#loop forver
spin:
  jmp spin

.p2align 2                                # force 4 byte alignment
gdt:
  SEG_NULL								# null seg
  SEG(STA_X|STA_R, 0x0, 0xffffffff)		# code seg
  SEG(STA_W, 0x0, 0xffffffff)	        # data seg

gdtdesc:
  .word   0x17                            # sizeof(gdt) - 1
  .long   gdt                             # address gdt

#string to print
msg1:
  .byte 'i',0x7,'n',0x7,' ',0x7,'r',0x7,'e',0x7,'a',0x7,'l',0x7,' ',0x7,'m',0x7,'o',0x7,'d',0x7,'e',0x7
msg2:
  .byte 'i',0x7,'n',0x7,' ',0x7,'p',0xf,'r',0xf,'o',0xf,'t',0xf,'e',0xf,'c',0xf,'t',0xf,'e',0xf,'d',0xf,' ',0x7,'m',0x7,'o',0x7,'d',0x7,'e',0x7
hellostring:
  .byte ':',0xf,' ',0xc,' ',0xc,'h',0xc,'e',0xc,'l',0xc,'l',0xc,'o',0xc,' ',0xc,'w',0xc,'o',0xc,'r',0xc,'l',0xc,'d',0xc
