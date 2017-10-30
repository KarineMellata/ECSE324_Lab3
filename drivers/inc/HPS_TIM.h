#ifndef __HPS_TIM
#define __HPS_TIM

	typedef enum {
		TIM0 = 0x00000001,
		TIM1 = 0x00000002,
		TIM2 = 0x00000004,
		TIM3 = 0x00000008
	} HPS_TIM_t;

	typedef struct {
		HPS_TIME_t tim;
		int timeout;
		int LD_en;
		int INT_en;
		int enable;
	}	HPS_TIM_cofig_t;
	
	/*The argument is a struct pointer*/
	extern void HPS_TIM_config_ASM(HPS_TIM_config_t *param);

	/*Reads the value of the S-bit (offset = 0x10)*/
	extern int HPS_TIM_read_INT_ASM(HPS_TIME_t tim);

	/*The argument is a struct pointer*/
	extern void HPS_TIM_clear_INT_ASM(HPS_TIM_t tim);

#endif
