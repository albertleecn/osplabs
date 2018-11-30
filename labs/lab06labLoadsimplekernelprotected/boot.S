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
  movw    $4,%cx
  rep     movsb

  movw    $hellostring,%si
  movw    $0xbe6,%di
  movw    $4,%cx
  rep     movsb               # print "hi" in real mode

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

#lgdtload:
  lgdt    gdtdesc
  movl    %cr0, %eax
  orl     $CR0_PE_ON, %eax
  movl    %eax, %cr0
 
  ljmp    $PROTECT_MODE_CSEG, $protcseg

  .code32                     # Assemble for 32-bit mode
protcseg:
  # Set up the protected-mode data segment registers
  movw    $PROTECT_MODE_DSEG, %ax    
  movw    %ax, %ds                # initiate Data Segment
  movw    %ax, %es                # Extra Segment
  movw    %ax, %fs                # 
  movw    %ax, %gs                # 
  movw    %ax, %ss                # Stack Segment

  movl    $msg2,%esi
  movl    $0xb8d22,%edi
  movl    $8,%ecx
  rep     movsb               #print "hello world" in protected mode

#Set up the stack pointer and call into C
  movl   $start, %esp
  call bootmain
 
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
  .byte 'r',0x7,':',0x7
msg2:
  .byte 'p',0x7,':',0x7
hellostring:
  .byte 'h',0xf,'i',0xc
