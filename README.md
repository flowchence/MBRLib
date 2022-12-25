## Introduction (23/02/2017)
A small assembly library I wrote specifically for anyone who doesn't understand x86 assembly and wants to modify the MBR. The library contains common instructions represented as macros.

## Main file
```assembly
%include "include\console.asm"
%include "include\graphics.asm" ; Drawing Functions
%include "include\string.asm" ; 
%include "include\sounds.asm" ; Sound Functions
%include "include\typedefs.asm" ; Definitions
bits 16
;cpu 8086
org BIOS_MEMORY_ADDRESS
jmp short main

main:
	; Your code here

times 510 - ($-$$) db 0
dw BOOT_SINAGURE ; 0xAA15
```

## Compilation
nasm [input file] -f bin -o [output file]

## References
https://www.win.tue.nl/~aeb/linux/kbd/scancodes-1.html
http://www.columbia.edu/~em36/wpdos/videomodes.txt
