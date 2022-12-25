%ifndef __SOUNDS_ASM__
%define __SOUNDS_ASM__

%macro init_speakers 0
	mov al, 182
	out 43h, al
%endmacro

%macro start_sound 0
	in al, 61h
	or al, 00000011b
	out 61h, al
%endmacro

%macro stop_sound 0
	in al, 61h
	and al, 11111100b
	out 61h, al
%endmacro

%macro sound_frequency 1
	out 42h, al
	mov al, %1
	out 42h, al
%endmacro

%macro sound_lsb 0
	mov al, bl
	out 42, al
%endmacro

%macro sound_msb 0
	mov al, bh
	out 42h, al
%endmacro

%endif