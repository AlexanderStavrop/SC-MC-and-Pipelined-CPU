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
static const char *ng0 = "C:/Users/Alex/Desktop/Organosh_real/Phase_1/GenericMux32.vhd";
extern char *IEEE_P_1242562249;

int ieee_p_1242562249_sub_1657552908_1035706684(char *, char *, char *);


static void work_a_4228852613_3212880686_p_0(char *t0)
{
    int64 t1;
    char *t2;
    char *t3;
    char *t4;
    int t5;
    int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;

LAB0:    xsi_set_current_line(29, ng0);

LAB3:    t1 = (10 * 1000LL);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 1192U);
    t4 = *((char **)t2);
    t2 = (t0 + 4840U);
    t5 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t4, t2);
    t6 = (t5 - 31);
    t7 = (t6 * -1);
    xsi_vhdl_check_range_of_index(31, 0, -1, t5);
    t8 = (32U * t7);
    t9 = (0 + t8);
    t10 = (t3 + t9);
    t11 = (t0 + 3072);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t10, 32U);
    xsi_driver_first_trans_delta(t11, 0U, 32U, t1);
    t16 = (t0 + 3072);
    xsi_driver_intertial_reject(t16, t1, t1);

LAB2:    t17 = (t0 + 2992);
    *((int *)t17) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_4228852613_3212880686_init()
{
	static char *pe[] = {(void *)work_a_4228852613_3212880686_p_0};
	xsi_register_didat("work_a_4228852613_3212880686", "isim/DATAPATH_tb_isim_beh.exe.sim/work/a_4228852613_3212880686.didat");
	xsi_register_executes(pe);
}
