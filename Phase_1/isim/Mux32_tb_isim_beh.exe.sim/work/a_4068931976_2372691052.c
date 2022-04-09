/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/Alex/Desktop/Organosh_real/Phase_1/Mux32_tb.vhd";



static void work_a_4068931976_2372691052_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    int64 t10;

LAB0:    t1 = (t0 + 2512U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(41, ng0);
    t2 = (t0 + 4901);
    t4 = (32U != 32U);
    if (t4 == 1)
        goto LAB4;

LAB5:    t5 = (t0 + 2896);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 32U);
    xsi_driver_first_trans_delta(t5, 32U, 32U, 0LL);
    xsi_set_current_line(42, ng0);
    t2 = (t0 + 4933);
    t4 = (32U != 32U);
    if (t4 == 1)
        goto LAB6;

LAB7:    t5 = (t0 + 2896);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 32U);
    xsi_driver_first_trans_delta(t5, 0U, 32U, 0LL);
    xsi_set_current_line(44, ng0);
    t2 = (t0 + 2960);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(45, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 2320);
    xsi_process_wait(t2, t10);

LAB10:    *((char **)t1) = &&LAB11;

LAB1:    return;
LAB4:    xsi_size_not_matching(32U, 32U, 0);
    goto LAB5;

LAB6:    xsi_size_not_matching(32U, 32U, 0);
    goto LAB7;

LAB8:    xsi_set_current_line(47, ng0);
    t2 = (t0 + 2960);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(48, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 2320);
    xsi_process_wait(t2, t10);

LAB14:    *((char **)t1) = &&LAB15;
    goto LAB1;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

LAB12:    xsi_set_current_line(50, ng0);
    t2 = (t0 + 4965);
    t4 = (32U != 32U);
    if (t4 == 1)
        goto LAB16;

LAB17:    t5 = (t0 + 2896);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 32U);
    xsi_driver_first_trans_delta(t5, 32U, 32U, 0LL);
    xsi_set_current_line(51, ng0);
    t2 = (t0 + 4997);
    t4 = (32U != 32U);
    if (t4 == 1)
        goto LAB18;

LAB19:    t5 = (t0 + 2896);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 32U);
    xsi_driver_first_trans_delta(t5, 0U, 32U, 0LL);
    xsi_set_current_line(53, ng0);
    t2 = (t0 + 2960);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(54, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 2320);
    xsi_process_wait(t2, t10);

LAB22:    *((char **)t1) = &&LAB23;
    goto LAB1;

LAB13:    goto LAB12;

LAB15:    goto LAB13;

LAB16:    xsi_size_not_matching(32U, 32U, 0);
    goto LAB17;

LAB18:    xsi_size_not_matching(32U, 32U, 0);
    goto LAB19;

LAB20:    xsi_set_current_line(56, ng0);
    t2 = (t0 + 2960);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(57, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 2320);
    xsi_process_wait(t2, t10);

LAB26:    *((char **)t1) = &&LAB27;
    goto LAB1;

LAB21:    goto LAB20;

LAB23:    goto LAB21;

LAB24:    xsi_set_current_line(59, ng0);

LAB30:    *((char **)t1) = &&LAB31;
    goto LAB1;

LAB25:    goto LAB24;

LAB27:    goto LAB25;

LAB28:    goto LAB2;

LAB29:    goto LAB28;

LAB31:    goto LAB29;

}


extern void work_a_4068931976_2372691052_init()
{
	static char *pe[] = {(void *)work_a_4068931976_2372691052_p_0};
	xsi_register_didat("work_a_4068931976_2372691052", "isim/Mux32_tb_isim_beh.exe.sim/work/a_4068931976_2372691052.didat");
	xsi_register_executes(pe);
}
