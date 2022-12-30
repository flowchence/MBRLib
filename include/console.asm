%ifndef __CONSOLE_ASM__
%define __CONSOLE_ASM__
; Definitions
%define reset_cursor set_cursor_position 0, 0h, 0h
%define _pusha8bit push ax, push al
%define _pushb8bit push bh, push bl
%define _pushc8bit push ch, push cl
%define _pushd8bit push dh, push dl

; Functions
%macro clear_screen 1
	mov ah, 07h
	xor al, al
	mov bh, %1 ; bios color
	mov dx, 184Fh
	int 10h
%endmacro

%macro get_byte 1
	mov ah, 2h
	mov dx %1
	int 14h
%endmacro

%macro get_cursor_pos_sz 1
	mov ah, 03h
	mov bh, %1
	int 10h
%endmacro

%macro get_serial_port_status 1
	mov ah, 3h
	mov dx, %1
	int 14h
%endmacro

%macro halt 0
	cli
	hlt
%endmacro

%macro read_attrib_cursor 1
	mov ah, 08h
	mov bh, %1
	int 10h
%endmacro

%macro read_sector 4
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

%macro reset_drive 0
	xor ah, ah
	int 13h
%endmacro

%macro reset_registers 0
    xor ax, ax
    xor ds, ds ; data segment
    xor es, es ; extra segment
    xor ss, ss ; stack segment
%endmacro

%macro select_video_page 1
	mov ah, 05h
	mov al, %1
	int 10h
%endmacro

%macro sendByte 2
	mov ah, 1h
	mov al, %1
	mov dx, %2
	int 14h
%endmacro

%macro set_cursor_sh_sz 2
	mov ah, 01h
	mov ch, %1
	mov cl, %2
	int 10h
%endmacro

%macro set_video_mode 1
	xor ah, ah
	mov al, %1
	int 10h
%endmacro

%macro set_cursor_position 3
	mov ah, 02h
	mov bh, %1
	mov dh, %2
	mov dl, %3
	int 10h
%endmacro

%macro write_attrib_cursor 4
	mov ah, 09h
	mov al, %1
	mov bh, %2
	mov bl, %3
	mov cx, %4
	int 10h
%endmacro

%macro write_char_cursor 3
	mov ah, 0Ah
	mov al, %1
	mov bh, %2
	mov cx, %3
	int 10h
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

%macro sleep 2
    mov cx, %1
	mov dx, %2
	mov ah, 86h
	int 15h
%endmacro

;%macro reboot 1
;	mov  AX, 0040h
;	mov  DS, AX
;	mov  word[0072h], %1
;	JMP  0FFFFh:0000h
;%endmacro
	
%endif