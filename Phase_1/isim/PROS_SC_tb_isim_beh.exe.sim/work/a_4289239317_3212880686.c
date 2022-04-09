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
static const char *ng0 = "C:/Users/Alex/Desktop/Organosh_real/Phase_1/Immed16to32.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_1242562249;

char *ieee_p_1242562249_sub_3410769178_1035706684(char *, char *, char *, char *, int );


static void work_a_4289239317_3212880686_p_0(char *t0)
{
    char t19[16];
    char t21[16];
    char t32[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    int t5;
    char *t6;
    char *t7;
    int t8;
    char *t9;
    char *t10;
    int t11;
    char *t12;
    char *t13;
    int t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t20;
    char *t22;
    char *t23;
    int t24;
    unsigned int t25;
    unsigned char t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    unsigned int t33;

LAB0:    t1 = (t0 + 2672U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(19, ng0);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t2 = (t0 + 5322);
    t5 = xsi_mem_cmp(t2, t3, 2U);
    if (t5 == 1)
        goto LAB5;

LAB10:    t6 = (t0 + 5324);
    t8 = xsi_mem_cmp(t6, t3, 2U);
    if (t8 == 1)
        goto LAB6;

LAB11:    t9 = (t0 + 5326);
    t11 = xsi_mem_cmp(t9, t3, 2U);
    if (t11 == 1)
        goto LAB7;

LAB12:    t12 = (t0 + 5328);
    t14 = xsi_mem_cmp(t12, t3, 2U);
    if (t14 == 1)
        goto LAB8;

LAB13:
LAB9:    xsi_set_current_line(19, ng0);
    t2 = (t0 + 5364);
    t4 = (t0 + 3336);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 32U);
    xsi_driver_first_trans_fast(t4);

LAB4:    xsi_set_current_line(19, ng0);

LAB23:    t2 = (t0 + 3240);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB24;

LAB1:    return;
LAB5:    xsi_set_current_line(19, ng0);
    t15 = (t0 + 5330);
    t17 = (t0 + 1032U);
    t18 = *((char **)t17);
    t20 = ((IEEE_P_2592010699) + 4024);
    t22 = (t21 + 0U);
    t23 = (t22 + 0U);
    *((int *)t23) = 0;
    t23 = (t22 + 4U);
    *((int *)t23) = 15;
    t23 = (t22 + 8U);
    *((int *)t23) = 1;
    t24 = (15 - 0);
    t25 = (t24 * 1);
    t25 = (t25 + 1);
    t23 = (t22 + 12U);
    *((unsigned int *)t23) = t25;
    t23 = (t0 + 5200U);
    t17 = xsi_base_array_concat(t17, t19, t20, (char)97, t15, t21, (char)97, t18, t23, (char)101);
    t25 = (16U + 16U);
    t26 = (32U != t25);
    if (t26 == 1)
        goto LAB15;

LAB16:    t27 = (t0 + 3336);
    t28 = (t27 + 56U);
    t29 = *((char **)t28);
    t30 = (t29 + 56U);
    t31 = *((char **)t30);
    memcpy(t31, t17, 32U);
    xsi_driver_first_trans_fast(t27);
    goto LAB4;

LAB6:    xsi_set_current_line(19, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 5200U);
    t4 = ieee_p_1242562249_sub_3410769178_1035706684(IEEE_P_1242562249, t19, t3, t2, 32);
    t6 = (t0 + 3336);
    t7 = (t6 + 56U);
    t9 = *((char **)t7);
    t10 = (t9 + 56U);
    t12 = *((char **)t10);
    memcpy(t12, t4, 32U);
    xsi_driver_first_trans_fast(t6);
    goto LAB4;

LAB7:    xsi_set_current_line(19, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 5346);
    t7 = ((IEEE_P_2592010699) + 4024);
    t9 = (t0 + 5200U);
    t10 = (t21 + 0U);
    t12 = (t10 + 0U);
    *((int *)t12) = 0;
    t12 = (t10 + 4U);
    *((int *)t12) = 15;
    t12 = (t10 + 8U);
    *((int *)t12) = 1;
    t5 = (15 - 0);
    t25 = (t5 * 1);
    t25 = (t25 + 1);
    t12 = (t10 + 12U);
    *((unsigned int *)t12) = t25;
    t6 = xsi_base_array_concat(t6, t19, t7, (char)97, t3, t9, (char)97, t2, t21, (char)101);
    t25 = (16U + 16U);
    t26 = (32U != t25);
    if (t26 == 1)
        goto LAB17;

LAB18:    t12 = (t0 + 3336);
    t13 = (t12 + 56U);
    t15 = *((char **)t13);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    memcpy(t17, t6, 32U);
    xsi_driver_first_trans_fast(t12);
    goto LAB4;

LAB8:    xsi_set_current_line(19, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 5200U);
    t4 = ieee_p_1242562249_sub_3410769178_1035706684(IEEE_P_1242562249, t19, t3, t2, 30);
    t6 = (t0 + 5362);
    t10 = ((IEEE_P_2592010699) + 4024);
    t12 = (t32 + 0U);
    t13 = (t12 + 0U);
    *((int *)t13) = 0;
    t13 = (t12 + 4U);
    *((int *)t13) = 1;
    t13 = (t12 + 8U);
    *((int *)t13) = 1;
    t5 = (1 - 0);
    t25 = (t5 * 1);
    t25 = (t25 + 1);
    t13 = (t12 + 12U);
    *((unsigned int *)t13) = t25;
    t9 = xsi_base_array_concat(t9, t21, t10, (char)97, t4, t19, (char)97, t6, t32, (char)101);
    t13 = (t19 + 12U);
    t25 = *((unsigned int *)t13);
    t25 = (t25 * 1U);
    t33 = (t25 + 2U);
    t26 = (32U != t33);
    if (t26 == 1)
        goto LAB19;

LAB20:    t15 = (t0 + 3336);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    t18 = (t17 + 56U);
    t20 = *((char **)t18);
    memcpy(t20, t9, 32U);
    xsi_driver_first_trans_fast(t15);
    goto LAB4;

LAB14:;
LAB15:    xsi_size_not_matching(32U, t25, 0);
    goto LAB16;

LAB17:    xsi_size_not_matching(32U, t25, 0);
    goto LAB18;

LAB19:    xsi_size_not_matching(32U, t33, 0);
    goto LAB20;

LAB21:    t3 = (t0 + 3240);
    *((int *)t3) = 0;
    goto LAB2;

LAB22:    goto LAB21;

LAB24:    goto LAB22;

}

static void work_a_4289239317_3212880686_p_1(char *t0)
{
    int64 t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;

LAB0:    xsi_set_current_line(24, ng0);

LAB3:    t1 = (10 * 1000LL);
    t2 = (t0 + 1512U);
    t3 = *((char **)t2);
    t2 = (t0 + 3400);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t3, 32U);
    xsi_driver_first_trans_delta(t2, 0U, 32U, t1);
    t8 = (t0 + 3400);
    xsi_driver_intertial_reject(t8, t1, t1);

LAB2:    t9 = (t0 + 3256);
    *((int *)t9) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_4289239317_3212880686_init()
{
	static char *pe[] = {(void *)work_a_4289239317_3212880686_p_0,(void *)work_a_4289239317_3212880686_p_1};
	xsi_register_didat("work_a_4289239317_3212880686", "isim/PROS_SC_tb_isim_beh.exe.sim/work/a_4289239317_3212880686.didat");
	xsi_register_executes(pe);
}
