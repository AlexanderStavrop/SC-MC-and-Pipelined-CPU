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
static const char *ng0 = "C:/Users/Alex/Desktop/Organosh_real/Phase_1/Adder4.vhd";
extern char *IEEE_P_3620187407;

char *ieee_p_3620187407_sub_436279890_3965413181(char *, char *, char *, char *, int );


static void work_a_1837178026_3212880686_p_0(char *t0)
{
    char t2[16];
    int64 t1;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    unsigned int t7;
    unsigned int t8;
    unsigned char t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;

LAB0:    xsi_set_current_line(16, ng0);

LAB3:    t1 = (10 * 1000LL);
    t3 = (t0 + 1032U);
    t4 = *((char **)t3);
    t3 = (t0 + 4332U);
    t5 = ieee_p_3620187407_sub_436279890_3965413181(IEEE_P_3620187407, t2, t4, t3, 4);
    t6 = (t2 + 12U);
    t7 = *((unsigned int *)t6);
    t8 = (1U * t7);
    t9 = (32U != t8);
    if (t9 == 1)
        goto LAB5;

LAB6:    t10 = (t0 + 2752);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t5, 32U);
    xsi_driver_first_trans_delta(t10, 0U, 32U, t1);
    t15 = (t0 + 2752);
    xsi_driver_intertial_reject(t15, t1, t1);

LAB2:    t16 = (t0 + 2672);
    *((int *)t16) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(32U, t8, 0);
    goto LAB6;

}


extern void work_a_1837178026_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1837178026_3212880686_p_0};
	xsi_register_didat("work_a_1837178026_3212880686", "isim/PROS_SC_tb_isim_beh.exe.sim/work/a_1837178026_3212880686.didat");
	xsi_register_executes(pe);
}
