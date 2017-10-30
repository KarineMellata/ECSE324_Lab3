	.text
	.equ BT_BASE, 0xFF200050
	.equ INT_BASE, 0xFF200058
	.equ EDGE_CAP, 0xFF20005C

	.equ N, 6
	.equ BASELINE, 0x00000001

	.global read_PB_data_ASM
	.global PB_data_is_pressed_ASM

	.global read_PB_edgecap_ASM
	.global PB_edgecap_is_pressed_ASM
	.global PB_clear_edgecap_ASM

	.global enable_PB_INT_ASM
	.global disable_PB_INT_ASM

read_PB_data_ASM:
	LDR R1, =BT_BASE
	LDR R0, [R1]
	BX LR

PB_data_is_pressed_ASM:
	
//

read_PB_edgecap_ASM:
	LDR R1, =EDGE_CAP
	LDR R0, [R1]
	BX LR

PB_edgecap_is_pressed_ASM:

PB_clear_edgecap_ASM:
	
//

enable_PB_INT_ASM:

disable_PB_INT_ASM:


	.end
