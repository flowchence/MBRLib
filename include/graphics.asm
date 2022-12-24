%macro set_pixel 3
	mov al, %1 ; Color
	mov cx, %2 ; X
	mov dx, %3 ; Y
	mov ah, 0CH
	int 10h
%endmacro
