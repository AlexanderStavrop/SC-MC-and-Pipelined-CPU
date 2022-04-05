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
static const char *ng0 = "C:/Users/Alex/Desktop/Organosh_real/Phase_1/Adder32.vhd";
extern char *IEEE_P_3499444699;

char *ieee_p_3499444699_sub_278355757_3536714472(char *, char *, char *, char *, char *, char *);


static void work_a_2482959074_3212880686_p_0(char *t0)
{
    char t2[16];
    int64 t1;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned char t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;

LAB0:    xsi_set_current_line(18, ng0);

LAB3:    t1 = (10 * 1000LL);
    t3 = (t0 + 1032U);
    t4 = *((char **)t3);
    t3 = (t0 + 4540U);
    t5 = (t0 + 1192U);
    t6 = *((char **)t5);
    t5 = (t0 + 4556U);
    t7 = ieee_p_3499444699_sub_278355757_3536714472(IEEE_P_3499444699, t2, t4, t3, t6, t5);
    t8 = (t2 + 12U);
    t9 = *((unsigned int *)t8);
    t10 = (1U * t9);
    t11 = (32U != t10);
    if (t11 == 1)
        goto LAB5;

LAB6:    t12 = (t0 + 2912);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t7, 32U);
    xsi_driver_first_trans_delta(t12, 0U, 32U, t1);
    t17 = (t0 + 2912);
    xsi_driver_intertial_reject(t17, t1, t1);

LAB2:    t18 = (t0 + 2832);
    *((int *)t18) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(32U, t10, 0);
    goto LAB6;

}


extern void work_a_2482959074_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2482959074_3212880686_p_0};
	xsi_register_didat("work_a_2482959074_3212880686", "isim/Adder32_tb_isim_beh.exe.sim/work/a_2482959074_3212880686.didat");
	xsi_register_executes(pe);
}
