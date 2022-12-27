%ifndef __GRAPHICS_ASM__
%define __GRAPHICS_ASM__

%macro set_pixel 3
	mov ah, 0CH
	mov al, %1 ; Color
	mov cx, %2 ; X
	mov dx, %3 ; Y
	int 10h
%endmacro

%macro _drawFunc1 7
	mov ah, %1
	; 06h Scholl up
	; 07h Scholl down
	mov al, %2
	mov bh, %3
	mov ch, %4
	mov cl, %5
	mov dh, %6
	mov dl, %7
	int 10h
%endmacro

%macro drawLine 4
	_drawFunc1 06h, 01h, %1, %2, %3, %2, %4
%endmacro

%macro writePixel 4
	mov ah, 0Ch
	mov al, %1
	mov bh, %2
	mov cx, %3
	mov dx, %4
	int 10h
%endmacro

%macro readPixel 3
	mov ah, 0Dh
	mov bh, %1
	mov cx, %2
	mov dx, %3
	int 10h
%endif

%macro select_graphics_palette 1
	mov ah, 0Bh
	mov bl, %1
	int 10h
%endmacro