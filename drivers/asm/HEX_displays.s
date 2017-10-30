	.text
	.equ N, 6
	.equ BASELINE, 0x00000001
	.equ BASE_7SEG1, 0xFF200020
	.equ BASE_7SEG2, 0xFF200030
	.global HEX_clear_ASM
	.global HEX_flood_ASM
	.global HEX_write_ASM

HEX_flood_ASM:
	MOV R1, #0
	LDR R2, =BASELINE
	LDR R3, =N
	LDR R6, =BASE_7SEG1
	LDR R7, =BASE_7SEG2

HEX_flood_loop:
	CMP R1, #4
	BGE set_zero2
	TST R0, R2
	BNE flood

mult3:
	LSL R2, R2, #1
	ADD R1, R1, #1
	B HEX_flood_loop

flood:
	ADD R4, R1, R6
	MOV R5, #255
	STRB R5, [R4]
	B mult3

set_zero2:
	MOV R1, #0

HEX_flood_loop2:
	CMP R1, #4
	BXGE LR
	TST R0, R2
	BNE flood2

mult4:
	LSL R2, R2, #1
	ADD R1, R1, #1
	B HEX_flood_loop2

flood2:
	ADD R4, R1, R7
	MOV R5, #255
	STRB R5, [R4]
	B mult4

//------------------------------------------
HEX_clear_ASM:
	MOV R1, #0
	LDR R2, =BASELINE
	LDR R3, =N
	LDR R6, =BASE_7SEG1
	LDR R7, =BASE_7SEG2

HEX_clear_loop: //this is for HEX0-HEX3
	CMP R1, #4
	BGE set_zero
	TST R0, R2
	BNE clear

mult:
	LSL R2, R2, #1
	ADD R1, R1, #1
	B HEX_clear_loop

clear:
	ADD R4, R1, R6
	MOV R5, #0
	STRB R5, [R4]
	B mult

set_zero:
	MOV R1, #0

HEX_clear_loop2: //this is for the HEX4-HEX5
	CMP R1, #2
	BXGE LR
	TST R0, R2
	BNE clear2

mult2:
	LSL R2, R2, #1
	ADD R1, R1, #1
	B HEX_clear_loop2

clear2:
	ADD R4, R1, R7
	MOV R5, #0
	STRB R5, [R4]
	B mult2
//------------------------------------------
HEX_write_ASM:
	CMP R1, #0
	BNE TEST_1
	MOV R1, #63
	B WRITE

TEST_1:		
	CMP R1, #1
	BNE TEST_2
	MOV R1, #6
	B WRITE

TEST_2:		
	CMP R1, #2
	BNE TEST_3
	MOV R1, #91
	B WRITE

TEST_3:		
	CMP R1, #3
	BNE TEST_4
	MOV R1, #79
	B WRITE

TEST_4:		
	CMP R1, #4
	BNE TEST_5
	MOV R1, #102
	B WRITE

TEST_5:		
	CMP R1, #5
	BNE TEST_6
	MOV R1, #109
	B WRITE

TEST_6:		
	CMP R1, #6
	BNE TEST_7
	MOV R1, #125
	B WRITE

TEST_7:		
	CMP R1, #7
	BNE TEST_8
	MOV R1, #39
	B WRITE

TEST_8:		
	CMP R1, #8
	BNE TEST_9
	MOV R1, #127
	B WRITE

TEST_9:		
	CMP R1, #9
	BNE TEST_A
	MOV R1, #111
	B WRITE

TEST_A:		
	CMP R1, #10
	BNE TEST_B
	MOV R1, #119
	B WRITE

TEST_B:		
	CMP R1, #11
	BNE TEST_C
	MOV R1, #124
	B WRITE

TEST_C:		
	CMP R1, #12
	BNE TEST_D
	MOV R1, #57
	B WRITE

TEST_D:		
	CMP R1, #13
	BNE TEST_E
	MOV R1, #94
	B WRITE

TEST_E:		
	CMP R1, #14
	BNE TEST_F
	MOV R1, #121
	B WRITE

TEST_F:		
	CMP R1, #15
	BXNE LR
	MOV R1, #113
	B WRITE

WRITE:		
	MOV R11, #0
	LDR R2, =BASELINE
	LDR R3, =N
	LDR R6, =BASE_7SEG1
	LDR R7, =BASE_7SEG2

HEX_write_loop: 
	CMP R11, #4
	BGE set_zero3
	TST R0, R2
	BNE write

mult5:	
	LSL R2, R2, #1
	ADD R11, R11, #1
	B HEX_write_loop

write:		
	ADD R4, R11, R6
	MOV R5, R1
	STRB R5, [R4]
	B mult5

set_zero3:	
	MOV R11, #0

HEX_write_loop2:
	CMP R11, #2
	BXGE LR
	TST R0, R2
	BNE write2

mult6:	
	LSL R2, R2, #1
	ADD R11, R11, #1
	B HEX_write_loop2

write2:		
	ADD R4, R11, R7
	MOV R5, R1
	STRB R5, [R4]
	B mult6 

	.end
