%ifndef __GRAPHICS_ASM__
%define __GRAPHICS_ASM__

%macro set_pixel 3
	mov al, %1 ; Color
	mov cx, %2 ; X
	mov dx, %3 ; Y
	mov ah, 0CH
	int 10h
%endmacro

%macro drawLine 4
	mov ah, 0x06
	mov al, 0x01
	mov bh, %1
	mov ch, %2
	mov cl, %3
	mov dh, %2
	mov dl, %4
	int 10h
%endmacro

%endif