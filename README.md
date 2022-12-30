## Introduction (23/02/2017)
A small assembly library I wrote specifically for anyone who doesn't understand x86 assembly and wants to modify the MBR (The bootloader because overwrite first 512 bytes of MBR). The library contains common instructions represented as macros.

## Main file
```assembly
%include "include\console.asm"
%include "include\graphics.asm" ; Drawing Functions
%include "include\string.asm"
%include "include\sounds.asm" ; Sound Functions
%include "include\typedefs.asm" ; Definitions
bits 16
;cpu 8086
org BIOS_MEMORY_ADDRESS ; 0x7c00
jmp short main

main:
	; Your code here

times 510 - ($-$$) db 0
dw BOOT_SINAGURE ; 0xAA15
```

# Documentation
| Function Definition  | Description  | Parameters  | Mode  |  Library  |  Notes |
| ------------ | ------------ | ------------ | ------------ | ------------ | ------------ |
|checkIsPressedKey|Check if key is pressed.|3 (Key's scancode, ...)|Real mode|string.asm|-|
|clear_screen| Clear the console screen and set default color.   |1 (Bios color attribute) |  Real mode|console.asm|-|
|get_cursor_pos_sz |Get cursor position and size.|1 (Page number)|Real mode |  console.asm|Return 4 registers (DH, DL, CH and CL).|
|get_current_video_info |Get current video information.|0|Real mode |graphics.asm|Return 3 registers (AH, AL and BH).|
|getPixelColor |Get color of a single pixel.|2 (Column and row)|Real mode |graphics.asm|Return 1 register (AL).|
|halt|Clear and halts CPU interrupts.|0|Real mode|console.asm|-|
|init_speakers|Initialize and load the PC speakers.|0|Real mode|sounds.asm|-|
|printChar|Print current character in console.(Teletype output)|0|Real mode|string.asm|-|
|printMessage|Print a string in console.|6 (Page number, message, color, message length, x and y)|Real mode|string.asm|-|
|read_attrib_cursor|Read character and attribute at cursor position. |1 (Page number)| Real mode|console.asm|Return 2 registers (AH and AL).|
|read_cpuinfo|Invoke cpuinfo instruction.|0|Real mode|random.asm|-|
|readPixel|Read a graphic pixel. |3 (Page number, column and row)| Real mode|graphics.asm|Return 1 register (AL).|
|read_timestamp|Invoke rdtsc instruction.|0|Real mode|random.asm|-|
|reset_cursor|Reset cursor position|0|Real mode|console.asm|-|
|reset_drive|Reset disk system|0| Real mode|console.asm|Return 1 register (AH).|
|reset_registers|Reset AX,DS,ES and SS registers.|0|Real mode|console.asm|-|
|select_graphics_palette|Select graphics palette or text border color. |1 (page number)|Real mode|graphics.asm|-|
|select_video_page|Select active video page. |1|Real mode|console.asm|-|
|setPixel|Set a pixel.|3 (Color, X and Y)|Real mode|graphics.asm|-|
|set_cursor_sh_sz|Set cursor shape and size (Text-mode).|2 (Cursor start and bottom line).|Real mode|console.asm|-|
|set_cursor_position|Set cursor position.|3 (Page number, row and column)|Real mode|console.asm|-|
|set_video_mode|Set video mode.|1 (Video mode)|Real mode.|console.asm|-|
|shutdown|Shutdown the machine.|0|Real mode|console.asm|-|
|sleep|Delay|2(interval in microseconds)|Real mode|console.asm|-|
|sound_frequency|Change frequency of current sound.|1 (Frequency)|Real mode|sounds.asm|-|
|stop_sound|Stop all invoked sound.|0|Real mode|sounds.asm|-|
|write_attrib_cursor|Write character and attribute at cursor position. |4 (Character, page number, attribute and number of times to display)|Real mode|console.asm|-|
|write_char_cursor|Write character at curspor position.|3 (Character, page number and number of times to display.)|Real mode|console.asm|-|
|writePixel|Write a graphic pixel. |4 (Color, page number column and row.)|Real mode|graphics.asm|-|
|writePixelTTY|Write a graphic pixel as TTY. |2 (Character and foreground number.)|Real mode|graphics.asm|Second argument is about graphics mode only.|
|xorshift8|8 bits xorshift|1|Real mode|string.asm|-|
|xorshift16|16 bits xorshift|1|Real mode|string.asm|-|
|xorshift32|32 bits xorshift|1|Real mode|string.asm|-|
## Compilation
nasm [input file] -f bin -o [output file]
qemu-system-i386 [output file] (if you using sounds.asm library add -s -soundhw pcspk to command.)

or make (for linux)

## References
+ http://www.win.tue.nl/~aeb/linux/kbd/scancodes-1.html
+ http://www.columbia.edu/~em36/wpdos/videomodes.txt
+ http://www.techhelpmanual.com/27-dos__bios___extensions_service_index.html
+ http://www.eecg.utoronto.ca/~amza/www.mindsec.com/files/x86regs.html