%ifndef __STRING_ASM__
%define __STRING_ASM__

%macro printChar 0
	mov ah, 0Eh ; Teletype output
	int 10h
%endmacro

%macro read_kb_input 0 ; Read keyboard input
	xor ax, ax
	int 16h
%endmacro

%macro printMessage 1
	mov si, %1
	push ax
	cld
	.next:
		lodsb
		test al, al
		jz .end
		printChar
		jmp .next
	.end
		pop ax
%endmacro

%macro checkIsPressedKey 3
	mov ah, 0
	int 16h
	cmp ah, %1
	je %2
	jne %3
%endmacro

%endif