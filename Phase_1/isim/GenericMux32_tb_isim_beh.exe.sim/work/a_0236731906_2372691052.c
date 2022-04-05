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
static const char *ng0 = "C:/Users/Alex/Desktop/Organosh_real/Phase_1/GenericMux32_tb.vhd";



static void work_a_0236731906_2372691052_p_0(char *t0)
{
    char *t1;
    char *t2;
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

LAB2:    xsi_set_current_line(38, ng0);
    t2 = (t0 + 5121);
    t4 = (32U != 32U);
    if (t4 == 1)
        goto LAB4;

LAB5:    t5 = (t0 + 2896);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 32U);
    xsi_driver_first_trans_delta(t5, 96U, 32U, 0LL);
    xsi_set_current_line(39, ng0);
    t2 = (t0 + 5153);
    t4 = (32U != 32U);
    if (t4 == 1)
        goto LAB6;

LAB7:    t5 = (t0 + 2896);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 32U);
    xsi_driver_first_trans_delta(t5, 64U, 32U, 0LL);
    xsi_set_current_line(40, ng0);
    t2 = (t0 + 5185);
    t4 = (32U != 32U);
    if (t4 == 1)
        goto LAB8;

LAB9:    t5 = (t0 + 2896);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 32U);
    xsi_driver_first_trans_delta(t5, 32U, 32U, 0LL);
    xsi_set_current_line(41, ng0);
    t2 = (t0 + 5217);
    t4 = (32U != 32U);
    if (t4 == 1)
        goto LAB10;

LAB11:    t5 = (t0 + 2896);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 32U);
    xsi_driver_first_trans_delta(t5, 0U, 32U, 0LL);
    xsi_set_current_line(43, ng0);
    t2 = (t0 + 5249);
    t5 = (t0 + 2960);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 5U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(44, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 2320);
    xsi_process_wait(t2, t10);

LAB14:    *((char **)t1) = &&LAB15;

LAB1:    return;
LAB4:    xsi_size_not_matching(32U, 32U, 0);
    goto LAB5;

LAB6:    xsi_size_not_matching(32U, 32U, 0);
    goto LAB7;

LAB8:    xsi_size_not_matching(32U, 32U, 0);
    goto LAB9;

LAB10:    xsi_size_not_matching(32U, 32U, 0);
    goto LAB11;

LAB12:    xsi_set_current_line(46, ng0);
    t2 = (t0 + 5254);
    t5 = (t0 + 2960);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 5U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(47, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 2320);
    xsi_process_wait(t2, t10);

LAB18:    *((char **)t1) = &&LAB19;
    goto LAB1;

LAB13:    goto LAB12;

LAB15:    goto LAB13;

LAB16:    xsi_set_current_line(49, ng0);
    t2 = (t0 + 5259);
    t5 = (t0 + 2960);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 5U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(50, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 2320);
    xsi_process_wait(t2, t10);

LAB22:    *((char **)t1) = &&LAB23;
    goto LAB1;

LAB17:    goto LAB16;

LAB19:    goto LAB17;

LAB20:    xsi_set_current_line(52, ng0);
    t2 = (t0 + 5264);
    t5 = (t0 + 2960);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 5U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(53, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 2320);
    xsi_process_wait(t2, t10);

LAB26:    *((char **)t1) = &&LAB27;
    goto LAB1;

LAB21:    goto LAB20;

LAB23:    goto LAB21;

LAB24:    xsi_set_current_line(59, ng0);
    t2 = (t0 + 5269);
    t4 = (32U != 32U);
    if (t4 == 1)
        goto LAB28;

LAB29:    t5 = (t0 + 2896);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 32U);
    xsi_driver_first_trans_delta(t5, 96U, 32U, 0LL);
    xsi_set_current_line(60, ng0);
    t2 = (t0 + 5301);
    t4 = (32U != 32U);
    if (t4 == 1)
        goto LAB30;

LAB31:    t5 = (t0 + 2896);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 32U);
    xsi_driver_first_trans_delta(t5, 64U, 32U, 0LL);
    xsi_set_current_line(61, ng0);
    t2 = (t0 + 5333);
    t4 = (32U != 32U);
    if (t4 == 1)
        goto LAB32;

LAB33:    t5 = (t0 + 2896);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 32U);
    xsi_driver_first_trans_delta(t5, 32U, 32U, 0LL);
    xsi_set_current_line(62, ng0);
    t2 = (t0 + 5365);
    t4 = (32U != 32U);
    if (t4 == 1)
        goto LAB34;

LAB35:    t5 = (t0 + 2896);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 32U);
    xsi_driver_first_trans_delta(t5, 0U, 32U, 0LL);
    xsi_set_current_line(64, ng0);
    t2 = (t0 + 5397);
    t5 = (t0 + 2960);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 5U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(65, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 2320);
    xsi_process_wait(t2, t10);

LAB38:    *((char **)t1) = &&LAB39;
    goto LAB1;

LAB25:    goto LAB24;

LAB27:    goto LAB25;

LAB28:    xsi_size_not_matching(32U, 32U, 0);
    goto LAB29;

LAB30:    xsi_size_not_matching(32U, 32U, 0);
    goto LAB31;

LAB32:    xsi_size_not_matching(32U, 32U, 0);
    goto LAB33;

LAB34:    xsi_size_not_matching(32U, 32U, 0);
    goto LAB35;

LAB36:    xsi_set_current_line(67, ng0);
    t2 = (t0 + 5402);
    t5 = (t0 + 2960);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 5U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(68, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 2320);
    xsi_process_wait(t2, t10);

LAB42:    *((char **)t1) = &&LAB43;
    goto LAB1;

LAB37:    goto LAB36;

LAB39:    goto LAB37;

LAB40:    xsi_set_current_line(70, ng0);
    t2 = (t0 + 5407);
    t5 = (t0 + 2960);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 5U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(71, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 2320);
    xsi_process_wait(t2, t10);

LAB46:    *((char **)t1) = &&LAB47;
    goto LAB1;

LAB41:    goto LAB40;

LAB43:    goto LAB41;

LAB44:    xsi_set_current_line(73, ng0);
    t2 = (t0 + 5412);
    t5 = (t0 + 2960);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 5U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(74, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 2320);
    xsi_process_wait(t2, t10);

LAB50:    *((char **)t1) = &&LAB51;
    goto LAB1;

LAB45:    goto LAB44;

LAB47:    goto LAB45;

LAB48:    xsi_set_current_line(76, ng0);

LAB54:    *((char **)t1) = &&LAB55;
    goto LAB1;

LAB49:    goto LAB48;

LAB51:    goto LAB49;

LAB52:    goto LAB2;

LAB53:    goto LAB52;

LAB55:    goto LAB53;

}


extern void work_a_0236731906_2372691052_init()
{
	static char *pe[] = {(void *)work_a_0236731906_2372691052_p_0};
	xsi_register_didat("work_a_0236731906_2372691052", "isim/GenericMux32_tb_isim_beh.exe.sim/work/a_0236731906_2372691052.didat");
	xsi_register_executes(pe);
}
