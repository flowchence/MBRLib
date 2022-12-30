%ifndef __DOS_ASM__
%define __DOS_ASM__

%macro dos_terminate_program 0
	mov ah, 4Ch
	int 21h
%endmacro

%endif

