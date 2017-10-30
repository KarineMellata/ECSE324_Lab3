	.text
	.equ N, 6
	.equ BASELINE, 0x00000001
	.equ BASE_7SEG1, 0xFF200020
	.equ BASE_7SEG2, 0xFF200030
	.global HPS_TIM_config_ASM
	.global HPS_TIM_read_INT_ASM
	.global HPS_TIM_clear_INT_ASM

/*------------------------------

HPS_TIM_config_ASM:
	LDR R0
	
