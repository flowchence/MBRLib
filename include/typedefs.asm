%ifndef __TYPEDEFS_ASM__
%define __TYPEDEFS_ASM__

; Standard
%define BOOT_SINAGURE 0xAA55
%define BIOS_MEMORY_ADDRESS 0x7c00

; Video Modes
%define VGA_TEXT_MODE360X400_16 0h
%define VGA_TEXT_MODE720X400_16 2h
%define VGA_GRAPHIC_MODE320X200_4 4h
%define VGA_GRAPHIC_MODE320X200_4G 5h
%define VGA_GRAPHIC_MODE640X200_2 6h
%define VGA_TEXT_MODE720X400_MONO 7h
%define VGA_GRAPHIC_MODE640X200_4 0Ah
%define VGA_GRAPHIC_MODE320X200_16 0Dh
%define VGA_GRAPHIC_MODE640X200_16 0Eh
%define VGA_GRAPHIC_MODE640X350_MONO 0Fh
%define VGA_GRAPHIC_MODE640X350_16 10h
%define VGA_GRAPHIC_MODE640X480_2 11h
%define VGA_GRAPHIC_MODE640X480_16 12h
%define VGA_GRAPHIC_MODE320x200_256 13h ; best graphical vga mode 256 colors 320x200 resolution
%define VGA_TEXT_MODE132X25_16 14h
; For more video modes, please check http://www.columbia.edu/~em36/wpdos/videomodes.txt

; BIOS Color Attributes
%define BLACK 0x0000
%define BLUE 0x0001
%define GREEN 0x0002
%define CYAN 0x0003
%define RED 0x0004
%define MAGENTA 0x0005
%define BROWN 0x0006
%define LIGHT_GRAY 0x0007
%define DARK_GRAY 0x0008
%define LIGHT_BLUE 0x0009
%define LIGHT_GREEN 0x000A
%define LIGHT_CYAN 0x000B
%define LIGHT_RED 0x000C
%define LIGHT_MAGENTA 0x000D
%define YELLOW 0x000E
%define WHITE 0x000F

; Boot codes
%define WARM_BOOT 1234h
%define COLD_BOOT 0000h

; Keyboard keys (scancodes)
%define ESC_KEY 1h
%define ONE_KEY 2h
%define TWO_KEY 3h
%define THREE_KEY 4h
%define FOUR_KEY 5h
%define FIVE_KEY 6h
%define SIX_KEY 7h
%define SEVEN_KEY 8h
%define EIGHT_KEY 9h
%define NINE_KEY 0Ah
%define ZERO_KEY 0Bh
%define BACKSPACE_KEY 0Eh
%define TAB_KEY 0Fh
%define Q_KEY 10h
%define W_KEY 11h
%define E_KEY 12h
%define R_KEY 13h
%define T_KEY 14h
%define Y_KEY 15h
%define U_KEY 16h
%define I_KEY 17h
%define O_KEY 18h
%define P_KEY 19h
%define ENTER_KEY 1Ch
%define A_KEY 1Eh
%define S_KEY 1Fh
%define D_KEY 20h
%define F_KEY 21h
%define G_KEY 22h
%define H_KEY 23h
%define J_KEY 24h
%define K_KEY 25h
%define L_KEY 26h
%define Z_KEY 2Ch
%define X_KEY 2Dh
%define C_KEY 2Eh
%define V_KEY 2Fh
%define B_KEY 30h
%define N_KEY 31h
%define M_KEY 32h
%define PRINTSCREEN_KEY 37h
%define SPACE_KEY 39h
%define CAPSLOCK_KEY 3Ah
%define F1_KEY 3Bh
%define F2_KEY 3Ch
%define F3_KEY 3Dh
%define F4_KEY 3Eh
%define F5_KEY 3Fh
%define F6_KEY 40h
%define F7_KEY 41h
%define F8_KEY 42h
%define F9_KEY 43h
%define F10_KEY 44h
%define UP_KEY 48h
%define PAGEUP_KEY 49h
%define LEFT_KEY 4Bh
%define RIGHT_KEY 4Dh
%define PAGEDOWN_KEY 51h
%define F11_KEY 85h
%define F12_KEY 86h
%define MINUS_KEY 0Ch
%define EQUAL_KEY 0Dh
%define SQUAREOPENBRACKET_KEY 1Ah
%define SQUARECLOSEBRACKET_KEY 1Bh
%define SEMICOLON_KEY 27h
%define BACKSLASH_KEY 2Bh
%define COMMA_KEY 33h
%define DOT_KEY 34h
%define FORESLHASH_KEY 35h
%define DELETE_KEY 53h
%define DOWN_KEY 50h
%define END_KEY 4Fh
%define KEY_ESC 01h
%define KEY_HOME 47h
%define KEY_INSERT 52h
%define KEY_KEYPAD_5 4Ch
%define KEY_KEYPAD_MUL 37h
%define KEY_KEYPAD_Minus 4Ah
%define KEY_KEYPAD_PLUS 4Eh
%define KEY_KEYPAD_DIV 35h

; Other
%define CPU_BIT_ID 00200000h

%endif