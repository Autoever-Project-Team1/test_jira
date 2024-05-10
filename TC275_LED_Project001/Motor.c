#include <gpt12.h>
#include <Ifx_reg.h>
#include <Ifx_Types.h>
#include <IfxGpt12.h>
#include <IfxPort.h>
#include "Motor.h"
#include "Bsp.h"


#define DIR_A       &MODULE_P10,1
#define PWM_A       &MODULE_P02,1
#define BREAK_A     &MODULE_P02,7

#define DIR_B       &MODULE_P10,2
#define PWM_B       &MODULE_P10,3
#define BREAK_B     &MODULE_P02,6

#define ISR_PROVIDER_GPT12_TIMER    IfxSrc_Tos_cpu0

void Init_DCMotors()
{
    /* Init CH-A (Left Motor) */
    IfxPort_setPinModeOutput(DIR_A, IfxPort_OutputMode_pushPull, IfxPort_OutputIdx_general);    /* DIR-A 출력 핀 설정 */
    IfxPort_setPinModeOutput(PWM_A, IfxPort_OutputMode_pushPull, IfxPort_OutputIdx_general);    /* PWM-A 출력 핀 설정 */
    IfxPort_setPinModeOutput(BREAK_A, IfxPort_OutputMode_pushPull, IfxPort_OutputIdx_general);  /* BRAKE-A 출력 핀 설정 */
    IfxPort_setPinHigh(DIR_A);      /* 모터 회전 방향 (1: 앞, 0: 뒤) */
    //IfxPort_setPinHigh(BREAK_A);    /* 모터 정지 (1: 정지, 0: PWM-A에 따라 동작) */
    IfxPort_setPinLow(PWM_A);      /* 100% PWM duty  */

    /* Init CH-B (Right Motor) */
    IfxPort_setPinModeOutput(DIR_B, IfxPort_OutputMode_pushPull, IfxPort_OutputIdx_general);    /* DIR-B 출력 핀 설정 */
    IfxPort_setPinModeOutput(PWM_B, IfxPort_OutputMode_pushPull, IfxPort_OutputIdx_general);    /* PWM-B 출력 핀 설정 */
    IfxPort_setPinModeOutput(BREAK_B, IfxPort_OutputMode_pushPull, IfxPort_OutputIdx_general);  /* BRAKE-B 출력 핀 설정 */
    IfxPort_setPinHigh(DIR_B);      /* 모터 회전 방향 (1: 앞, 0: 뒤) */
    //IfxPort_setPinHigh(BREAK_B);    /* 모터 정지 (1: 정지, 0: PWM-B에 따라 동작) */
    IfxPort_setPinLow(PWM_B);      /* 100% PWM duty  */

    init_gpt2();
}

