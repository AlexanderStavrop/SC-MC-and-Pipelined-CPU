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
static const char *ng0 = "C:/Users/Alex/Desktop/Organosh_real/Phase_1/Mux5.vhd";



static void work_a_1334747372_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    unsigned char t4;
    char *t5;
    char *t6;
    int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    static char *nl0[] = {&&LAB7, &&LAB7, &&LAB5, &&LAB6, &&LAB7, &&LAB7, &&LAB7, &&LAB7, &&LAB7};

LAB0:    t1 = (t0 + 2672U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(25, ng0);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t2 = (char *)((nl0) + t4);
    goto **((char **)t2);

LAB4:    xsi_set_current_line(25, ng0);

LAB10:    t2 = (t0 + 3240);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB11;

LAB1:    return;
LAB5:    xsi_set_current_line(25, ng0);
    t5 = (t0 + 1032U);
    t6 = *((char **)t5);
    t7 = (0 - 1);
    t8 = (t7 * -1);
    t9 = (5U * t8);
    t10 = (0 + t9);
    t5 = (t6 + t10);
    t11 = (t0 + 3336);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t5, 5U);
    xsi_driver_first_trans_fast(t11);
    goto LAB4;

LAB6:    xsi_set_current_line(25, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t7 = (1 - 1);
    t8 = (t7 * -1);
    t9 = (5U * t8);
    t10 = (0 + t9);
    t2 = (t3 + t10);
    t5 = (t0 + 3336);
    t6 = (t5 + 56U);
    t11 = *((char **)t6);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t2, 5U);
    xsi_driver_first_trans_fast(t5);
    goto LAB4;

LAB7:    xsi_set_current_line(25, ng0);
    t2 = (t0 + 5188);
    t5 = (t0 + 3336);
    t6 = (t5 + 56U);
    t11 = *((char **)t6);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t2, 5U);
    xsi_driver_first_trans_fast(t5);
    goto LAB4;

LAB8:    t3 = (t0 + 3240);
    *((int *)t3) = 0;
    goto LAB2;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

}

static void work_a_1334747372_3212880686_p_1(char *t0)
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

LAB0:    xsi_set_current_line(28, ng0);

LAB3:    t1 = (10 * 1000LL);
    t2 = (t0 + 1512U);
    t3 = *((char **)t2);
    t2 = (t0 + 3400);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t3, 5U);
    xsi_driver_first_trans_delta(t2, 0U, 5U, t1);
    t8 = (t0 + 3400);
    xsi_driver_intertial_reject(t8, t1, t1);

LAB2:    t9 = (t0 + 3256);
    *((int *)t9) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_1334747372_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1334747372_3212880686_p_0,(void *)work_a_1334747372_3212880686_p_1};
	xsi_register_didat("work_a_1334747372_3212880686", "isim/PROS_SC_tb_isim_beh.exe.sim/work/a_1334747372_3212880686.didat");
	xsi_register_executes(pe);
}
