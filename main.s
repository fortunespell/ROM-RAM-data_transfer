PRESERVE8 ; Used to specify 8-byte alignment of stack
Stack EQU 0x00000100 ;Define stack size
AREA STACK, NOINIT, READWRITE,ALIGN=3 ; AREA directive is used to define a code or
;data segment in arm assembly program
StackMem SPACE Stack ; STACK directive is used to define stack segment
; SPACE directive is used to define
;specify that from label "StackMem" to next 256 byte have to be 0 initialized

AREA RESET, DATA , READONLY ; This is a data segment which defines vector ;table which points to different interrupt handlers
EXPORT Vectors ; Export is used to specify that the block of code
Vectors
DCD StackMem + Stack ; Starts with address of stack pointer
DCD Reset_Handler

AREA tempData, DATA, READONLY, ALIGN=4
ROMARRAY1 DCD 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08
; Initializing Array1 in the ROM
ROMARRAY2 DCD 0x09, 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16
; Initializing Array2 in the ROM

AREA |.data|, DATA, READWRITE, ALIGN=4
LEN EQU 0x08 ; Length of Array,8 words
ARRAY1 SPACE 32 ; 32 bytes allocated for Array 1

ARRAY2 SPACE 32 ; 32 bytes allocated for Array 2
AREA |.text|, CODE , READONLY , ALIGN=4
ENTRY
EXPORT Reset_Handler ; Defining reset handler
Reset_Handler ; Reset handler starts
Reset_Handler_End ; Reset handler ends
MOV
LDR
R0, #0x10
R1, =ROMARRAY2 + 28

; HEX(16) = Length of 2 Arrays
; Point to last address of Array 2 on ROM 28 = (LEN-1) * 4
LDR R2, =ARRAY2 + 28 ; Point to last address of Array 2 on RAM28 = (LEN-1) * 4
MEMCPY_LOOP
LDR R3, [R1],#-4 ; Load data from address pointed by R1, and
STR R3,[R2],#-4

;decrement the address in R1 by 0x04
; Load data from address pointed by R2, and
;decrement the address in R2 by 0x04

SUBS R0, R0, #1 ; Decrement the length
BNE MEMCPY_LOOP ; Loop till length is equal to 0
MOV R0, #LEN ; Store the length of single array to R0
LDR R1,=ARRAY1+28 ; Point to last address of Array 1on RAM 28 = (LEN-1) * 4
LDR R2,=ARRAY2+28 ; Point to last address of Array 2on RAM 28 = (LEN-1) * 4
EXCH_LOOP
LDR R3, [R1]
LDR R4, [R2]
STR R4, [R1], #-4
STR R3, [R2], #-4
SUBS R0, R0, #1
BNE EXCH_LOOP
STOP B STOP
END
