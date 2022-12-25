%ifndef __CONSOLE_ASM__
%define __CONSOLE_ASM__

%macro clear_screen 1 ; Clear the console screen and set default color.
	mov ah, 6
	xor al, al
	mov bh, %1 ; bios color
	xor cx, cx
	mov dx, 184FH
	int 10h
%endmacro

%macro clear_screen_set_video_mode 1 ; Clear the console screen and set video mode.
	xor ah, ah
	mov al, %1
	int 10h
%endmacro

%macro set_video_mode 1
	mov ax, %1
	int 10h
%endmacro

%macro set_color 1
	mov ah, 9h
	mov cx, 1000h
	mov al, 20h
	mov bl, %1
	int 10h
%endmacro

%macro sleep 2
	push dx
    mov cx, %1
	mov dx, %2
	mov ah, 86h
	int 15h
	pop dx
%endmacro

%macro move_cursor 2
	mov ah, 2
	xor al, al
	xor bh, bh
	mov dh, %1
	mov dl, %2
	int 10h
%endmacro

%macro reset_cursor 0
	move_cursor 0, 0
%endmacro

%macro reboot 1
	mov ax, 40h
	mov ds, ax
	mov word [72h], %1
	jmp 0FFFFh:0000h
	;jmp 0xf000:0xfff0
%endmacro

%macro shutdown 0
    mov ax, 1h
    mov ax, ss
    mov sp, 0xf000
    mov ax, 0x5307
    mov bx, 1h
    mov cx, 3h
    int 15h
%endmacro

%endif