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
org BIOS_MEMORY_ADDRESS
jmp short main

main:
	; Your code here

times 510 - ($-$$) db 0
dw BOOT_SINAGURE ; 0xAA15
```

# Documentation
| Function  | Description  | Parameters  | Mode  |  Library  |  Notes |
| ------------ | ------------ | ------------ | ------------ | ------------ | ------------ |
| checkIsPressedKey  | Check if key is pressed. | 3 (Key's scancode, ...)  |  Real mode  | string.asm  | - |
| clear_screen  |  Clear the console screen and set default color. | 1 (Color)  |  Real mode  | console.asm | - |
| clear_screen_set_video_mode  | Clear the console screen and set default video mode.  |  1 (video mode)  |  Real mode  |  console.asm  | - |
| drawLine  |  Draw a line in screen.  |  4 (1 - background and foreground color, 2 - )  | Real mode  | graphics.asm  | - |
| halt  |  Clear and halts CPU interrupts.  | 0  | Real mode  | console.asm  | - |
| init_speakers  | Initialize and load speakers.  | 0  |  Real mode  | sounds.asm  | - |
| init_randomizer  | Set seed and initialize the randomizer. | 1 (Seed)  |  Real mode  | string.asm  | - |
| move_cursor  | Move cursor position  | 2 (X and Y)  |  Real mode  | console.asm  | - |
| printChar  | Print current character in console. | 0  |  Real mode  | string.asm  | - |
| read_disk  | Read a disk sector | 4  |  Real mode  | console.asm  | - |
| read_pixel  | Read a graphic pixel. | 3 (video page, column and row) |  Real mode  | graphics.asm  | - |
| read_timestamp  | Invoke rdtsc instruction. | 0  |  Real mode  | string.asm  | - |
| reboot | Reboot the machine. | 1 (type boot) | - | console.asm | - |
| reset_cursor  | Reset cursor position  | 0  |  Real mode  | console.asm  | - |
| reset_registers  | Reset AX,DS,ES and SS registers. | 0  |  Real mode  | console.asm  | - |
| send_sound  | Send a sound. | 0  |  Real mode  | sounds.asm  | - |
| write_char_cursor  | Write Character/Attribute to Cursor Location.  | 1 (Color)  |  Real mode  | console.asm  | textmode, color |
| set_video_mode  | Change video mode  | 1 (Video mode)  |  Real mode  | console.asm  | - |
| set_pixel  | Set a pixel | 3 (Color, X and Y)  |  Real mode  | graphics.asm  | - |
| shutdown  | Shutdown the machine.  | 0  |  Real mode  | console.asm  | - |
| sleep  | Delay  | 2 (interval in microseconds)  |  Real mode  | console.asm  | - |
| sound_frequency  | Change sound frequency | 1 (Frequency)  |  Real mode  | sounds.asm  | - |
| sound_lsb  | - | 0  |  Real mode  | sounds.asm  | - |
| sound_msb  | - | 0  |  Real mode  | sounds.asm  | - |
| stop_sound  | Stop all sounds. | 0  |  Real mode  | sounds.asm  | - |
| xorshift8  | - | 1 (Result)  |  Real mode  | string.asm  | - |
| xorshift16  | - | 1 (Result)  |  Real mode  | string.asm  | - |
| xorshift32  | -  | 1 (Result)  |  Real mode  | string.asm  | - |
| writePixel  | Write a graphic pixel.  | 4 (Color, video page, column and row.)  |  Real mode  | graphics.asm  | - |

## Compilation
nasm [input file] -f bin -o [output file]
qemu-system-i386 [output file] (if you using sounds.asm library add -s -soundhw pcspk to command.)

## References
https://www.win.tue.nl/~aeb/linux/kbd/scancodes-1.html
http://www.columbia.edu/~em36/wpdos/videomodes.txt
http://www.techhelpmanual.com/27-dos__bios___extensions_service_index.html