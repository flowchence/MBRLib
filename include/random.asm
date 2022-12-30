%ifndef __RANDOM_ASM__
%define __RANDOM_ASM__

%macro read_timestamp 0
	rdtsc
%endmacro

%macro read_cpuinfo 0
	cpuid
%endmacro

%macro init_randomizer 1
	read_timestamp
	mov word [%1], ax  ; seed
%endmacro

%macro _xorshift 4
	push ax
	mov ax, %4
	shl ax, %1
	xor %4, ax
	mov ax, %4
	shr ax, %2
	xor %4, ax
	mov ax, %4
	shl ax, %3
	xor %4, ax
	pop ax
%endmacro

%macro xorshift8 1
	_xorshift 1, 1, 2, %1
%endmacro

%macro xorshift16 1
	_xorshift 7, 9, 8, %1
%endmacro

%macro xorshift32 1
	_xorshift 13, 17, 5, %1
%endmacro

%endif