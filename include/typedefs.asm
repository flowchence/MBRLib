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

; Scancodes
%define ESC_SCANCODE 1h
%define ONE_SCANCODE 2h
%define TWO_SCANCODE 3h
%define THREE_SCANCODE 4h
%define FOUR_SCANCODE 5h
%define FIVE_SCANCODE 6h
%define SIX_SCANCODE 7h
%define SEVEN_SCANCODE 8h
%define EIGHT_SCANCODE 9h
%define NINE_SCANCODE 0Ah
%define ZERO_SCANCODE 0Bh
%define BACKSPACE_SCANCODE 0Eh
%define TAB_SCANCODE 0Fh
%define Q_SCANCODE 10h
%define W_SCANCODE 11h
%define E_SCANCODE 12h
%define R_SCANCODE 13h
%define T_SCANCODE 14h
%define Y_SCANCODE 15h
%define U_SCANCODE 16h
%define I_SCANCODE 17h
%define O_SCANCODE 18h
%define P_SCANCODE 19h
%define ENTER_SCANCODE 1Ch
%define A_SCANCODE 1Eh
%define S_SCANCODE 1Fh
%define D_SCANCODE 20h
%define F_SCANCODE 21h
%define G_SCANCODE 22h
%define H_SCANCODE 23h
%define J_SCANCODE 24h
%define K_SCANCODE 25h
%define L_SCANCODE 26h
%define Z_SCANCODE 2Ch
%define X_SCANCODE 2Dh
%define C_SCANCODE 2Eh
%define V_SCANCODE 2Fh
%define B_SCANCODE 30h
%define N_SCANCODE 31h
%define M_SCANCODE 32h
%define SPACE_SCANCODE 39h
%define CAPSLOCK_SCANCODE 3Ah
%define F1_SCANCODE 3Bh
%define F2_SCANCODE 3Ch
%define F3_SCANCODE 3Dh
%define F4_SCANCODE 3Eh
%define F5_SCANCODE 3Fh
%define F6_SCANCODE 40h
%define F7_SCANCODE 41h
%define F8_SCANCODE 42h
%define F9_SCANCODE 43h
%define F10_SCANCODE 44h
%define F11_SCANCODE 85h
%define F12_SCANCODE 86h

; Other
%define CPU_BIT_ID 00200000h


%endif