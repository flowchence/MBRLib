%ifndef __STRING_ASM__
%define __STRING_ASM__

%macro checkIsPressedKey 3
	read_kb_input
	cmp ah, %1
	je %2
	jne %3
%endmacro

%macro printChar 0
	mov ah, 0Eh ; Teletype output
	int 10h
%endmacro

%macro printMessage 6
	mov bh, %1
	mov ax, 0h
	mov es, ax
	mov bp, %2
	mov ah, 13h
	mov bl, %3
	mov al, 1
	mov cx, %4
	mov dh, %5
	mov dl, %6
	int 10h
	;hlt
%endmacro

%macro read_kb_input 0
	xor ax, ax
	int 16h
	ret
%endmacro

%endif