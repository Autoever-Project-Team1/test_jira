

/*********************************************************************************************************************/
/*-----------------------------------------------------Includes------------------------------------------------------*/
/*********************************************************************************************************************/
#include "AppScheduling.h"
#include "Driver_STM.h"
#include "Blinky_LED.h"
#include "Driver_ADC.h"
#include "asclin.h"
#include "GtmTomPwm.h"
#include "Encoder.h"
#include "PID_Controller.h"
#include "Trajectory.h"

#include <stdio.h>
#include "math.h"

#include "GPT12.h"
extern void setLeftMotorDuty(unsigned int duty);



char str[100];
uint32 data = 0;


/*********************************************************************************************************************/
/*------------------------------------------------------Macros-------------------------------------------------------*/
/*********************************************************************************************************************/
typedef struct
{
        uint32 u32nuCnt1ms;
        uint32 u32nuCnt10ms;
        uint32 u32nuCnt100ms;
        uint32 u32nuCnt50ms;
        uint32 u32nuCnt500ms;
        uint32 u32nuCnt1000ms;

}TestCnt;


/*********************************************************************************************************************/
/*-------------------------------------------------Global variables--------------------------------------------------*/
/*********************************************************************************************************************/

/*********************************************************************************************************************/
/*--------------------------------------------Private Variables/Constants--------------------------------------------*/
/*********************************************************************************************************************/

/*********************************************************************************************************************/
/*------------------------------------------------Function Prototypes------------------------------------------------*/
/*********************************************************************************************************************/
static void AppNoTask(void);
static void AppTask1ms(void);
static void AppTask10ms(void);
static void AppTask50ms(void);
static void AppTask100ms(void);
static void AppTask500ms(void);
static void AppTask1000ms(void);

/*********************************************************************************************************************/
/*---------------------------------------------Function Implementations----------------------------------------------*/
/*********************************************************************************************************************/
TestCnt stTestCnt;

uint32 W_RPM;
double w_ref;
int second_timer = 0;
double Wd = 0;

double pos_target=0;

double currentPos=0;
double currentVel=0;

double currentPos2=0;
double currentVel2=0;

extern double Target;
extern double TargetV;

extern int g_cnt;
extern unsigned int lMotorDuty;
extern unsigned int rMotorDuty;

static void AppNoTask(void)
{
    readEncoderTick();

}

static void AppTask1ms(void)
{
    /*count*/
    stTestCnt.u32nuCnt1ms++;

    Conv_rad_per_sec();

    PID_Vel_Con(pos_pid.Win, g_LPF_Encoder.LPF_rad_per_sec);
    PID_Vel_Con2(pos_pid2.Win, g_LPF_Encoder2.LPF_rad_per_sec);


    currentPos = MakeTrajectoryPos(720,0,1,(double)stTestCnt.u32nuCnt1ms);
    currentPos2 = MakeTrajectoryPos(360,0,1,(double)stTestCnt.u32nuCnt1ms);

    ////currentVel = MakeTrajectoryVel(720,0,2,(double)stTestCnt.u32nuCnt1ms);

    setRightMotorDuty(100.0*(vel_pid.Vin)/12);
    setLeftMotorDuty(100.0*(vel_pid2.Vin)/12);


    //g_GtmTomPwmHl.tOn[0] = (double)(vel_pid.Vin)/12;
    //GtmTomPwmHl_run();

    //g_GtmTomPwmHl.tOn[1] = (double)(vel_pid2.Vin)/12;
    //GtmTomPwmHl_run();

    sprintf(str, "%d\t%d\t\n",lMotorDuty,rMotorDuty);
}
static void AppTask10ms(void)
{
    /*count*/
    stTestCnt.u32nuCnt10ms++;

    DrvAdc_GetAdcRawGroup0();
    data = stSensorAdcRaw.sen1_Raw;

    PID_Pos_Con(currentPos,g_LPF_Encoder.LPF_Deg);
    PID_Pos_Con2(currentPos2,g_LPF_Encoder2.LPF_Deg);

}
static void AppTask50ms(void)
{
    /*count*/
    stTestCnt.u32nuCnt50ms++;


}
static void AppTask100ms(void)
{
    /*count*/
    stTestCnt.u32nuCnt100ms++;

    /*UART*/
       char idx = 0;
           while(1)
           {
               if(str[idx] == '\0')
               {
                   break;
               }
               _out_uart3(str[idx++]);
           }

}
static void AppTask500ms(void)
{
    /*count*/
    stTestCnt.u32nuCnt500ms++;

}

static void AppTask1000ms(void)
{
    /*count*/
    stTestCnt.u32nuCnt1000ms++;

}
void AppScheduling(void)
{
    AppNoTask();

    if(stSchedulingInfo.u8nuScheduling1msFlag == 1u)
    {
        stSchedulingInfo.u8nuScheduling1msFlag = 0u;
        AppTask1ms();

        if(stSchedulingInfo.u8nuScheduling10msFlag == 1u)
        {
            stSchedulingInfo.u8nuScheduling10msFlag = 0u;
            AppTask10ms();
        }
        if(stSchedulingInfo.u8nuScheduling50msFlag == 1u)
        {
            stSchedulingInfo.u8nuScheduling50msFlag = 0u;
            AppTask50ms();
        }
        if(stSchedulingInfo.u8nuScheduling100msFlag == 1u)
        {
            stSchedulingInfo.u8nuScheduling100msFlag = 0u;
            AppTask100ms();
        }
        if(stSchedulingInfo.u8nuScheduling500msFlag == 1u)
        {
            stSchedulingInfo.u8nuScheduling500msFlag = 0u;
            AppTask500ms();
        }
        if(stSchedulingInfo.u8nuScheduling1000msFlag == 1u)
        {
            stSchedulingInfo.u8nuScheduling1000msFlag = 0u;
            AppTask1000ms();
        }
    }
}

