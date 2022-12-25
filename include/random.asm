%ifndef __RANDOM_ASM__
%define __RANDOM_ASM__

%macro read_timestamp 0
	rdtsc
%endmacro

%macro init_randomizer 1
	read_timestamp
	mov word [%1], ax  ; seed
%endmacro

%macro _xorshift 3
	mov ax, bx
	shl ax, %1
	xor bx, ax
	mov ax, bx
	shr ax, %2
	xor bx, ax
	mov ax, bx
	shl ax, %3
	xor bx, ax
	mov ax, bx
	ret
%endmacro

%macro xorshift8 0
	_xorshift 7, 5, 3
%endmacro

%macro xorshift16 0
	_xorshift 7, 9, 8
%endmacro

%macro xorshift32 0
	_xorshift 13, 17, 5
%endmacro

%endif