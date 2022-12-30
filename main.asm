%include "include\console.asm"
%include "include\graphics.asm"
%include "include\string.asm"
%include "include\typedefs.asm"
%include "include\sounds.asm"
bits 16
cpu 8086
org BIOS_MEMORY_ADDRESS
jmp short main

main:
	clear_screen 0xE
	printMessage 0, msg, 0xF, msglen, 0, 0
	reset_cursor

msg: dw "Hello world."
msglen: equ $-msg
times 510 - ($-$$) db 0
dw BOOT_SINAGURE