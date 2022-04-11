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
static const char *ng0 = "C:/Users/Alex/Desktop/Organosh_real/Phase_1/MEMSTAGE.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_3499444699;

char *ieee_p_3499444699_sub_4232465333_3536714472(char *, char *, char *, char *, int );


static void work_a_4200723274_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(19, ng0);

LAB3:    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 5408);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 5264);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_4200723274_3212880686_p_1(char *t0)
{
    char t9[16];
    char t11[16];
    char t16[16];
    char *t1;
    char *t3;
    char *t4;
    unsigned int t5;
    unsigned int t6;
    unsigned int t7;
    char *t8;
    char *t10;
    char *t12;
    char *t13;
    int t14;
    unsigned int t15;
    char *t17;
    int t18;
    unsigned char t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;

LAB0:    xsi_set_current_line(21, ng0);

LAB3:    t1 = (t0 + 8498);
    t3 = (t0 + 1352U);
    t4 = *((char **)t3);
    t5 = (31 - 31);
    t6 = (t5 * 1U);
    t7 = (0 + t6);
    t3 = (t4 + t7);
    t10 = ((IEEE_P_2592010699) + 4024);
    t12 = (t11 + 0U);
    t13 = (t12 + 0U);
    *((int *)t13) = 0;
    t13 = (t12 + 4U);
    *((int *)t13) = 1;
    t13 = (t12 + 8U);
    *((int *)t13) = 1;
    t14 = (1 - 0);
    t15 = (t14 * 1);
    t15 = (t15 + 1);
    t13 = (t12 + 12U);
    *((unsigned int *)t13) = t15;
    t13 = (t16 + 0U);
    t17 = (t13 + 0U);
    *((int *)t17) = 31;
    t17 = (t13 + 4U);
    *((int *)t17) = 2;
    t17 = (t13 + 8U);
    *((int *)t17) = -1;
    t18 = (2 - 31);
    t15 = (t18 * -1);
    t15 = (t15 + 1);
    t17 = (t13 + 12U);
    *((unsigned int *)t17) = t15;
    t8 = xsi_base_array_concat(t8, t9, t10, (char)97, t1, t11, (char)97, t3, t16, (char)101);
    t15 = (2U + 30U);
    t19 = (32U != t15);
    if (t19 == 1)
        goto LAB5;

LAB6:    t17 = (t0 + 5472);
    t20 = (t17 + 56U);
    t21 = *((char **)t20);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    memcpy(t23, t8, 32U);
    xsi_driver_first_trans_fast(t17);

LAB2:    t24 = (t0 + 5280);
    *((int *)t24) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(32U, t15, 0);
    goto LAB6;

}

static void work_a_4200723274_3212880686_p_2(char *t0)
{
    char t1[16];
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned char t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;

LAB0:    xsi_set_current_line(22, ng0);

LAB3:    t2 = (t0 + 2472U);
    t3 = *((char **)t2);
    t2 = (t0 + 8312U);
    t4 = ieee_p_3499444699_sub_4232465333_3536714472(IEEE_P_3499444699, t1, t3, t2, 1024);
    t5 = (t1 + 12U);
    t6 = *((unsigned int *)t5);
    t7 = (1U * t6);
    t8 = (32U != t7);
    if (t8 == 1)
        goto LAB5;

LAB6:    t9 = (t0 + 5536);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t4, 32U);
    xsi_driver_first_trans_fast_port(t9);

LAB2:    t14 = (t0 + 5296);
    *((int *)t14) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(32U, t7, 0);
    goto LAB6;

}

static void work_a_4200723274_3212880686_p_3(char *t0)
{
    char t14[16];
    char t15[16];
    char t18[16];
    char *t1;
    char *t2;
    char *t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    int t16;
    unsigned int t17;
    char *t19;
    int t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    static char *nl0[] = {&&LAB7, &&LAB7, &&LAB5, &&LAB6, &&LAB7, &&LAB7, &&LAB7, &&LAB7, &&LAB7};

LAB0:    t1 = (t0 + 4696U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(24, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t2 = (char *)((nl0) + t4);
    goto **((char **)t2);

LAB4:    xsi_set_current_line(24, ng0);

LAB12:    t2 = (t0 + 5312);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB13;

LAB1:    return;
LAB5:    xsi_set_current_line(25, ng0);
    t5 = (t0 + 1672U);
    t6 = *((char **)t5);
    t5 = (t0 + 5600);
    t7 = (t5 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t6, 32U);
    xsi_driver_first_trans_fast_port(t5);
    goto LAB4;

LAB6:    xsi_set_current_line(25, ng0);
    t2 = (t0 + 8500);
    t5 = (t0 + 1672U);
    t6 = *((char **)t5);
    t11 = (31 - 7);
    t12 = (t11 * 1U);
    t13 = (0 + t12);
    t5 = (t6 + t13);
    t8 = ((IEEE_P_2592010699) + 4024);
    t9 = (t15 + 0U);
    t10 = (t9 + 0U);
    *((int *)t10) = 0;
    t10 = (t9 + 4U);
    *((int *)t10) = 23;
    t10 = (t9 + 8U);
    *((int *)t10) = 1;
    t16 = (23 - 0);
    t17 = (t16 * 1);
    t17 = (t17 + 1);
    t10 = (t9 + 12U);
    *((unsigned int *)t10) = t17;
    t10 = (t18 + 0U);
    t19 = (t10 + 0U);
    *((int *)t19) = 7;
    t19 = (t10 + 4U);
    *((int *)t19) = 0;
    t19 = (t10 + 8U);
    *((int *)t19) = -1;
    t20 = (0 - 7);
    t17 = (t20 * -1);
    t17 = (t17 + 1);
    t19 = (t10 + 12U);
    *((unsigned int *)t19) = t17;
    t7 = xsi_base_array_concat(t7, t14, t8, (char)97, t2, t15, (char)97, t5, t18, (char)101);
    t17 = (24U + 8U);
    t4 = (32U != t17);
    if (t4 == 1)
        goto LAB8;

LAB9:    t19 = (t0 + 5600);
    t21 = (t19 + 56U);
    t22 = *((char **)t21);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    memcpy(t24, t7, 32U);
    xsi_driver_first_trans_fast_port(t19);
    goto LAB4;

LAB7:    xsi_set_current_line(25, ng0);
    t2 = (t0 + 8524);
    t5 = (t0 + 5600);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 32U);
    xsi_driver_first_trans_fast_port(t5);
    goto LAB4;

LAB8:    xsi_size_not_matching(32U, t17, 0);
    goto LAB9;

LAB10:    t3 = (t0 + 5312);
    *((int *)t3) = 0;
    goto LAB2;

LAB11:    goto LAB10;

LAB13:    goto LAB11;

}

static void work_a_4200723274_3212880686_p_4(char *t0)
{
    char t14[16];
    char t15[16];
    char t18[16];
    char *t1;
    char *t2;
    char *t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    int t16;
    unsigned int t17;
    char *t19;
    int t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    static char *nl0[] = {&&LAB7, &&LAB7, &&LAB5, &&LAB6, &&LAB7, &&LAB7, &&LAB7, &&LAB7, &&LAB7};

LAB0:    t1 = (t0 + 4944U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(29, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t2 = (char *)((nl0) + t4);
    goto **((char **)t2);

LAB4:    xsi_set_current_line(29, ng0);

LAB12:    t2 = (t0 + 5328);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB13;

LAB1:    return;
LAB5:    xsi_set_current_line(30, ng0);
    t5 = (t0 + 1512U);
    t6 = *((char **)t5);
    t5 = (t0 + 5664);
    t7 = (t5 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t6, 32U);
    xsi_driver_first_trans_fast_port(t5);
    goto LAB4;

LAB6:    xsi_set_current_line(30, ng0);
    t2 = (t0 + 8556);
    t5 = (t0 + 1512U);
    t6 = *((char **)t5);
    t11 = (31 - 7);
    t12 = (t11 * 1U);
    t13 = (0 + t12);
    t5 = (t6 + t13);
    t8 = ((IEEE_P_2592010699) + 4024);
    t9 = (t15 + 0U);
    t10 = (t9 + 0U);
    *((int *)t10) = 0;
    t10 = (t9 + 4U);
    *((int *)t10) = 23;
    t10 = (t9 + 8U);
    *((int *)t10) = 1;
    t16 = (23 - 0);
    t17 = (t16 * 1);
    t17 = (t17 + 1);
    t10 = (t9 + 12U);
    *((unsigned int *)t10) = t17;
    t10 = (t18 + 0U);
    t19 = (t10 + 0U);
    *((int *)t19) = 7;
    t19 = (t10 + 4U);
    *((int *)t19) = 0;
    t19 = (t10 + 8U);
    *((int *)t19) = -1;
    t20 = (0 - 7);
    t17 = (t20 * -1);
    t17 = (t17 + 1);
    t19 = (t10 + 12U);
    *((unsigned int *)t19) = t17;
    t7 = xsi_base_array_concat(t7, t14, t8, (char)97, t2, t15, (char)97, t5, t18, (char)101);
    t17 = (24U + 8U);
    t4 = (32U != t17);
    if (t4 == 1)
        goto LAB8;

LAB9:    t19 = (t0 + 5664);
    t21 = (t19 + 56U);
    t22 = *((char **)t21);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    memcpy(t24, t7, 32U);
    xsi_driver_first_trans_fast_port(t19);
    goto LAB4;

LAB7:    xsi_set_current_line(30, ng0);
    t2 = (t0 + 8580);
    t5 = (t0 + 5664);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 32U);
    xsi_driver_first_trans_fast_port(t5);
    goto LAB4;

LAB8:    xsi_size_not_matching(32U, t17, 0);
    goto LAB9;

LAB10:    t3 = (t0 + 5328);
    *((int *)t3) = 0;
    goto LAB2;

LAB11:    goto LAB10;

LAB13:    goto LAB11;

}


extern void work_a_4200723274_3212880686_init()
{
	static char *pe[] = {(void *)work_a_4200723274_3212880686_p_0,(void *)work_a_4200723274_3212880686_p_1,(void *)work_a_4200723274_3212880686_p_2,(void *)work_a_4200723274_3212880686_p_3,(void *)work_a_4200723274_3212880686_p_4};
	xsi_register_didat("work_a_4200723274_3212880686", "isim/PROS_SC_tb_isim_beh.exe.sim/work/a_4200723274_3212880686.didat");
	xsi_register_executes(pe);
}
