%ifndef __CONSOLE_ASM__
%define __CONSOLE_ASM__

%macro clear_screen 1
	mov ah, 6
	xor al, al
	mov bh, %1 ; bios color
	xor cx, cx
	mov dx, 184Fh
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

%macro write_char_cursor 1
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

%macro shutdown 0
    mov ax, 1h
    mov ax, ss
    mov sp, 0F000h
    mov ax, 5307h
    mov bx, 1h
    mov cx, 3h
    int 15h
%endmacro

%macro reset_registers 0
    xor ax, ax
    xor ds, ds ; data segment
    xor es, es ; extra segment
    xor ss, ss ; stack segment
%endmacro

%macro read_disk 4
	mov ah, 2h
	mov al, %1
	mov bx, %2
	mov ch, 0h
	mov cl, 2h
	mov dh, 0h
	mov dl, %3
	int 13h
	jc %4
%endmacro

%macro halt 0
	cli
	hlt
%endmacro

%macro reboot 1
	mov  AX, 0040h
	mov  DS, AX
	mov  word[0072h], %1
	JMP  0FFFFh:0000h
%endmacro
	
%endif