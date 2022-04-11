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
static const char *ng0 = "C:/Users/Alex/Desktop/Organosh_real/Phase_1/CONTROL_tb.vhd";



static void work_a_3491362456_2372691052_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    unsigned char t7;
    char *t8;
    char *t9;
    int64 t10;

LAB0:    t1 = (t0 + 4112U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(68, ng0);
    t2 = (t0 + 4496);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(72, ng0);
    t2 = (t0 + 7656);
    t7 = (6U != 6U);
    if (t7 == 1)
        goto LAB4;

LAB5:    t4 = (t0 + 4560);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t4, 0U, 6U, 0LL);
    xsi_set_current_line(73, ng0);
    t2 = (t0 + 7662);
    t7 = (20U != 20U);
    if (t7 == 1)
        goto LAB6;

LAB7:    t4 = (t0 + 4560);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 20U);
    xsi_driver_first_trans_delta(t4, 6U, 20U, 0LL);
    xsi_set_current_line(74, ng0);
    t2 = (t0 + 4624);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(82, ng0);
    t2 = (t0 + 7682);
    t7 = (6U != 6U);
    if (t7 == 1)
        goto LAB8;

LAB9:    t4 = (t0 + 4560);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t4, 26U, 6U, 0LL);
    xsi_set_current_line(83, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 3920);
    xsi_process_wait(t2, t10);

LAB12:    *((char **)t1) = &&LAB13;

LAB1:    return;
LAB4:    xsi_size_not_matching(6U, 6U, 0);
    goto LAB5;

LAB6:    xsi_size_not_matching(20U, 20U, 0);
    goto LAB7;

LAB8:    xsi_size_not_matching(6U, 6U, 0);
    goto LAB9;

LAB10:    xsi_set_current_line(85, ng0);
    t2 = (t0 + 7688);
    t7 = (6U != 6U);
    if (t7 == 1)
        goto LAB14;

LAB15:    t4 = (t0 + 4560);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t4, 26U, 6U, 0LL);
    xsi_set_current_line(86, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 3920);
    xsi_process_wait(t2, t10);

LAB18:    *((char **)t1) = &&LAB19;
    goto LAB1;

LAB11:    goto LAB10;

LAB13:    goto LAB11;

LAB14:    xsi_size_not_matching(6U, 6U, 0);
    goto LAB15;

LAB16:    xsi_set_current_line(88, ng0);
    t2 = (t0 + 7694);
    t7 = (6U != 6U);
    if (t7 == 1)
        goto LAB20;

LAB21:    t4 = (t0 + 4560);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t4, 26U, 6U, 0LL);
    xsi_set_current_line(89, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 3920);
    xsi_process_wait(t2, t10);

LAB24:    *((char **)t1) = &&LAB25;
    goto LAB1;

LAB17:    goto LAB16;

LAB19:    goto LAB17;

LAB20:    xsi_size_not_matching(6U, 6U, 0);
    goto LAB21;

LAB22:    xsi_set_current_line(91, ng0);
    t2 = (t0 + 7700);
    t7 = (6U != 6U);
    if (t7 == 1)
        goto LAB26;

LAB27:    t4 = (t0 + 4560);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t4, 26U, 6U, 0LL);
    xsi_set_current_line(92, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 3920);
    xsi_process_wait(t2, t10);

LAB30:    *((char **)t1) = &&LAB31;
    goto LAB1;

LAB23:    goto LAB22;

LAB25:    goto LAB23;

LAB26:    xsi_size_not_matching(6U, 6U, 0);
    goto LAB27;

LAB28:    xsi_set_current_line(94, ng0);
    t2 = (t0 + 7706);
    t7 = (6U != 6U);
    if (t7 == 1)
        goto LAB32;

LAB33:    t4 = (t0 + 4560);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t4, 26U, 6U, 0LL);
    xsi_set_current_line(95, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 3920);
    xsi_process_wait(t2, t10);

LAB36:    *((char **)t1) = &&LAB37;
    goto LAB1;

LAB29:    goto LAB28;

LAB31:    goto LAB29;

LAB32:    xsi_size_not_matching(6U, 6U, 0);
    goto LAB33;

LAB34:    xsi_set_current_line(97, ng0);
    t2 = (t0 + 7712);
    t7 = (6U != 6U);
    if (t7 == 1)
        goto LAB38;

LAB39:    t4 = (t0 + 4560);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t4, 26U, 6U, 0LL);
    xsi_set_current_line(98, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 3920);
    xsi_process_wait(t2, t10);

LAB42:    *((char **)t1) = &&LAB43;
    goto LAB1;

LAB35:    goto LAB34;

LAB37:    goto LAB35;

LAB38:    xsi_size_not_matching(6U, 6U, 0);
    goto LAB39;

LAB40:    xsi_set_current_line(100, ng0);
    t2 = (t0 + 7718);
    t7 = (6U != 6U);
    if (t7 == 1)
        goto LAB44;

LAB45:    t4 = (t0 + 4560);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t4, 26U, 6U, 0LL);
    xsi_set_current_line(101, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 3920);
    xsi_process_wait(t2, t10);

LAB48:    *((char **)t1) = &&LAB49;
    goto LAB1;

LAB41:    goto LAB40;

LAB43:    goto LAB41;

LAB44:    xsi_size_not_matching(6U, 6U, 0);
    goto LAB45;

LAB46:    xsi_set_current_line(103, ng0);
    t2 = (t0 + 7724);
    t7 = (6U != 6U);
    if (t7 == 1)
        goto LAB50;

LAB51:    t4 = (t0 + 4560);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t4, 26U, 6U, 0LL);
    xsi_set_current_line(104, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 3920);
    xsi_process_wait(t2, t10);

LAB54:    *((char **)t1) = &&LAB55;
    goto LAB1;

LAB47:    goto LAB46;

LAB49:    goto LAB47;

LAB50:    xsi_size_not_matching(6U, 6U, 0);
    goto LAB51;

LAB52:    xsi_set_current_line(106, ng0);
    t2 = (t0 + 7730);
    t7 = (6U != 6U);
    if (t7 == 1)
        goto LAB56;

LAB57:    t4 = (t0 + 4560);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t4, 26U, 6U, 0LL);
    xsi_set_current_line(107, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 3920);
    xsi_process_wait(t2, t10);

LAB60:    *((char **)t1) = &&LAB61;
    goto LAB1;

LAB53:    goto LAB52;

LAB55:    goto LAB53;

LAB56:    xsi_size_not_matching(6U, 6U, 0);
    goto LAB57;

LAB58:    xsi_set_current_line(109, ng0);
    t2 = (t0 + 7736);
    t7 = (6U != 6U);
    if (t7 == 1)
        goto LAB62;

LAB63:    t4 = (t0 + 4560);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t4, 26U, 6U, 0LL);
    xsi_set_current_line(110, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 3920);
    xsi_process_wait(t2, t10);

LAB66:    *((char **)t1) = &&LAB67;
    goto LAB1;

LAB59:    goto LAB58;

LAB61:    goto LAB59;

LAB62:    xsi_size_not_matching(6U, 6U, 0);
    goto LAB63;

LAB64:    xsi_set_current_line(112, ng0);
    t2 = (t0 + 7742);
    t7 = (6U != 6U);
    if (t7 == 1)
        goto LAB68;

LAB69:    t4 = (t0 + 4560);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t4, 26U, 6U, 0LL);
    xsi_set_current_line(113, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 3920);
    xsi_process_wait(t2, t10);

LAB72:    *((char **)t1) = &&LAB73;
    goto LAB1;

LAB65:    goto LAB64;

LAB67:    goto LAB65;

LAB68:    xsi_size_not_matching(6U, 6U, 0);
    goto LAB69;

LAB70:    xsi_set_current_line(115, ng0);
    t2 = (t0 + 7748);
    t7 = (6U != 6U);
    if (t7 == 1)
        goto LAB74;

LAB75:    t4 = (t0 + 4560);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t4, 26U, 6U, 0LL);
    xsi_set_current_line(116, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 3920);
    xsi_process_wait(t2, t10);

LAB78:    *((char **)t1) = &&LAB79;
    goto LAB1;

LAB71:    goto LAB70;

LAB73:    goto LAB71;

LAB74:    xsi_size_not_matching(6U, 6U, 0);
    goto LAB75;

LAB76:    xsi_set_current_line(129, ng0);
    t2 = (t0 + 7754);
    t7 = (6U != 6U);
    if (t7 == 1)
        goto LAB80;

LAB81:    t4 = (t0 + 4560);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t4, 0U, 6U, 0LL);
    xsi_set_current_line(130, ng0);
    t2 = (t0 + 7760);
    t7 = (20U != 20U);
    if (t7 == 1)
        goto LAB82;

LAB83:    t4 = (t0 + 4560);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 20U);
    xsi_driver_first_trans_delta(t4, 6U, 20U, 0LL);
    xsi_set_current_line(131, ng0);
    t2 = (t0 + 7780);
    t7 = (6U != 6U);
    if (t7 == 1)
        goto LAB84;

LAB85:    t4 = (t0 + 4560);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t4, 26U, 6U, 0LL);
    xsi_set_current_line(132, ng0);
    t2 = (t0 + 4624);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(133, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 3920);
    xsi_process_wait(t2, t10);

LAB88:    *((char **)t1) = &&LAB89;
    goto LAB1;

LAB77:    goto LAB76;

LAB79:    goto LAB77;

LAB80:    xsi_size_not_matching(6U, 6U, 0);
    goto LAB81;

LAB82:    xsi_size_not_matching(20U, 20U, 0);
    goto LAB83;

LAB84:    xsi_size_not_matching(6U, 6U, 0);
    goto LAB85;

LAB86:    xsi_set_current_line(146, ng0);
    t2 = (t0 + 7786);
    t7 = (6U != 6U);
    if (t7 == 1)
        goto LAB90;

LAB91:    t4 = (t0 + 4560);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t4, 0U, 6U, 0LL);
    xsi_set_current_line(147, ng0);
    t2 = (t0 + 7792);
    t7 = (20U != 20U);
    if (t7 == 1)
        goto LAB92;

LAB93:    t4 = (t0 + 4560);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 20U);
    xsi_driver_first_trans_delta(t4, 6U, 20U, 0LL);
    xsi_set_current_line(148, ng0);
    t2 = (t0 + 7812);
    t7 = (6U != 6U);
    if (t7 == 1)
        goto LAB94;

LAB95:    t4 = (t0 + 4560);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t4, 26U, 6U, 0LL);
    xsi_set_current_line(149, ng0);
    t2 = (t0 + 4624);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(150, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 3920);
    xsi_process_wait(t2, t10);

LAB98:    *((char **)t1) = &&LAB99;
    goto LAB1;

LAB87:    goto LAB86;

LAB89:    goto LAB87;

LAB90:    xsi_size_not_matching(6U, 6U, 0);
    goto LAB91;

LAB92:    xsi_size_not_matching(20U, 20U, 0);
    goto LAB93;

LAB94:    xsi_size_not_matching(6U, 6U, 0);
    goto LAB95;

LAB96:    xsi_set_current_line(163, ng0);
    t2 = (t0 + 7818);
    t7 = (6U != 6U);
    if (t7 == 1)
        goto LAB100;

LAB101:    t4 = (t0 + 4560);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t4, 0U, 6U, 0LL);
    xsi_set_current_line(164, ng0);
    t2 = (t0 + 7824);
    t7 = (20U != 20U);
    if (t7 == 1)
        goto LAB102;

LAB103:    t4 = (t0 + 4560);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 20U);
    xsi_driver_first_trans_delta(t4, 6U, 20U, 0LL);
    xsi_set_current_line(165, ng0);
    t2 = (t0 + 7844);
    t7 = (6U != 6U);
    if (t7 == 1)
        goto LAB104;

LAB105:    t4 = (t0 + 4560);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t4, 26U, 6U, 0LL);
    xsi_set_current_line(166, ng0);
    t2 = (t0 + 4624);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(167, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 3920);
    xsi_process_wait(t2, t10);

LAB108:    *((char **)t1) = &&LAB109;
    goto LAB1;

LAB97:    goto LAB96;

LAB99:    goto LAB97;

LAB100:    xsi_size_not_matching(6U, 6U, 0);
    goto LAB101;

LAB102:    xsi_size_not_matching(20U, 20U, 0);
    goto LAB103;

LAB104:    xsi_size_not_matching(6U, 6U, 0);
    goto LAB105;

LAB106:    xsi_set_current_line(180, ng0);
    t2 = (t0 + 7850);
    t7 = (6U != 6U);
    if (t7 == 1)
        goto LAB110;

LAB111:    t4 = (t0 + 4560);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t4, 0U, 6U, 0LL);
    xsi_set_current_line(181, ng0);
    t2 = (t0 + 7856);
    t7 = (20U != 20U);
    if (t7 == 1)
        goto LAB112;

LAB113:    t4 = (t0 + 4560);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 20U);
    xsi_driver_first_trans_delta(t4, 6U, 20U, 0LL);
    xsi_set_current_line(182, ng0);
    t2 = (t0 + 7876);
    t7 = (6U != 6U);
    if (t7 == 1)
        goto LAB114;

LAB115:    t4 = (t0 + 4560);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t4, 26U, 6U, 0LL);
    xsi_set_current_line(183, ng0);
    t2 = (t0 + 4624);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(184, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 3920);
    xsi_process_wait(t2, t10);

LAB118:    *((char **)t1) = &&LAB119;
    goto LAB1;

LAB107:    goto LAB106;

LAB109:    goto LAB107;

LAB110:    xsi_size_not_matching(6U, 6U, 0);
    goto LAB111;

LAB112:    xsi_size_not_matching(20U, 20U, 0);
    goto LAB113;

LAB114:    xsi_size_not_matching(6U, 6U, 0);
    goto LAB115;

LAB116:    xsi_set_current_line(197, ng0);
    t2 = (t0 + 7882);
    t7 = (6U != 6U);
    if (t7 == 1)
        goto LAB120;

LAB121:    t4 = (t0 + 4560);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t4, 0U, 6U, 0LL);
    xsi_set_current_line(198, ng0);
    t2 = (t0 + 7888);
    t7 = (20U != 20U);
    if (t7 == 1)
        goto LAB122;

LAB123:    t4 = (t0 + 4560);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 20U);
    xsi_driver_first_trans_delta(t4, 6U, 20U, 0LL);
    xsi_set_current_line(199, ng0);
    t2 = (t0 + 7908);
    t7 = (6U != 6U);
    if (t7 == 1)
        goto LAB124;

LAB125:    t4 = (t0 + 4560);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t4, 26U, 6U, 0LL);
    xsi_set_current_line(200, ng0);
    t2 = (t0 + 4624);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(201, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 3920);
    xsi_process_wait(t2, t10);

LAB128:    *((char **)t1) = &&LAB129;
    goto LAB1;

LAB117:    goto LAB116;

LAB119:    goto LAB117;

LAB120:    xsi_size_not_matching(6U, 6U, 0);
    goto LAB121;

LAB122:    xsi_size_not_matching(20U, 20U, 0);
    goto LAB123;

LAB124:    xsi_size_not_matching(6U, 6U, 0);
    goto LAB125;

LAB126:    xsi_set_current_line(214, ng0);
    t2 = (t0 + 7914);
    t7 = (6U != 6U);
    if (t7 == 1)
        goto LAB130;

LAB131:    t4 = (t0 + 4560);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t4, 0U, 6U, 0LL);
    xsi_set_current_line(215, ng0);
    t2 = (t0 + 7920);
    t7 = (20U != 20U);
    if (t7 == 1)
        goto LAB132;

LAB133:    t4 = (t0 + 4560);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 20U);
    xsi_driver_first_trans_delta(t4, 6U, 20U, 0LL);
    xsi_set_current_line(216, ng0);
    t2 = (t0 + 7940);
    t7 = (6U != 6U);
    if (t7 == 1)
        goto LAB134;

LAB135:    t4 = (t0 + 4560);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t4, 26U, 6U, 0LL);
    xsi_set_current_line(217, ng0);
    t2 = (t0 + 4624);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(218, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 3920);
    xsi_process_wait(t2, t10);

LAB138:    *((char **)t1) = &&LAB139;
    goto LAB1;

LAB127:    goto LAB126;

LAB129:    goto LAB127;

LAB130:    xsi_size_not_matching(6U, 6U, 0);
    goto LAB131;

LAB132:    xsi_size_not_matching(20U, 20U, 0);
    goto LAB133;

LAB134:    xsi_size_not_matching(6U, 6U, 0);
    goto LAB135;

LAB136:    xsi_set_current_line(231, ng0);
    t2 = (t0 + 7946);
    t7 = (6U != 6U);
    if (t7 == 1)
        goto LAB140;

LAB141:    t4 = (t0 + 4560);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t4, 0U, 6U, 0LL);
    xsi_set_current_line(232, ng0);
    t2 = (t0 + 7952);
    t7 = (20U != 20U);
    if (t7 == 1)
        goto LAB142;

LAB143:    t4 = (t0 + 4560);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 20U);
    xsi_driver_first_trans_delta(t4, 6U, 20U, 0LL);
    xsi_set_current_line(233, ng0);
    t2 = (t0 + 7972);
    t7 = (6U != 6U);
    if (t7 == 1)
        goto LAB144;

LAB145:    t4 = (t0 + 4560);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t4, 26U, 6U, 0LL);
    xsi_set_current_line(234, ng0);
    t2 = (t0 + 4624);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(235, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 3920);
    xsi_process_wait(t2, t10);

LAB148:    *((char **)t1) = &&LAB149;
    goto LAB1;

LAB137:    goto LAB136;

LAB139:    goto LAB137;

LAB140:    xsi_size_not_matching(6U, 6U, 0);
    goto LAB141;

LAB142:    xsi_size_not_matching(20U, 20U, 0);
    goto LAB143;

LAB144:    xsi_size_not_matching(6U, 6U, 0);
    goto LAB145;

LAB146:    xsi_set_current_line(237, ng0);
    t2 = (t0 + 4624);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(238, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 3920);
    xsi_process_wait(t2, t10);

LAB152:    *((char **)t1) = &&LAB153;
    goto LAB1;

LAB147:    goto LAB146;

LAB149:    goto LAB147;

LAB150:    xsi_set_current_line(251, ng0);
    t2 = (t0 + 7978);
    t7 = (6U != 6U);
    if (t7 == 1)
        goto LAB154;

LAB155:    t4 = (t0 + 4560);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t4, 0U, 6U, 0LL);
    xsi_set_current_line(252, ng0);
    t2 = (t0 + 7984);
    t7 = (20U != 20U);
    if (t7 == 1)
        goto LAB156;

LAB157:    t4 = (t0 + 4560);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 20U);
    xsi_driver_first_trans_delta(t4, 6U, 20U, 0LL);
    xsi_set_current_line(253, ng0);
    t2 = (t0 + 8004);
    t7 = (6U != 6U);
    if (t7 == 1)
        goto LAB158;

LAB159:    t4 = (t0 + 4560);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t4, 26U, 6U, 0LL);
    xsi_set_current_line(254, ng0);
    t2 = (t0 + 4624);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(255, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 3920);
    xsi_process_wait(t2, t10);

LAB162:    *((char **)t1) = &&LAB163;
    goto LAB1;

LAB151:    goto LAB150;

LAB153:    goto LAB151;

LAB154:    xsi_size_not_matching(6U, 6U, 0);
    goto LAB155;

LAB156:    xsi_size_not_matching(20U, 20U, 0);
    goto LAB157;

LAB158:    xsi_size_not_matching(6U, 6U, 0);
    goto LAB159;

LAB160:    xsi_set_current_line(257, ng0);
    t2 = (t0 + 4624);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(258, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 3920);
    xsi_process_wait(t2, t10);

LAB166:    *((char **)t1) = &&LAB167;
    goto LAB1;

LAB161:    goto LAB160;

LAB163:    goto LAB161;

LAB164:    xsi_set_current_line(271, ng0);
    t2 = (t0 + 8010);
    t7 = (6U != 6U);
    if (t7 == 1)
        goto LAB168;

LAB169:    t4 = (t0 + 4560);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t4, 0U, 6U, 0LL);
    xsi_set_current_line(272, ng0);
    t2 = (t0 + 8016);
    t7 = (20U != 20U);
    if (t7 == 1)
        goto LAB170;

LAB171:    t4 = (t0 + 4560);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 20U);
    xsi_driver_first_trans_delta(t4, 6U, 20U, 0LL);
    xsi_set_current_line(273, ng0);
    t2 = (t0 + 8036);
    t7 = (6U != 6U);
    if (t7 == 1)
        goto LAB172;

LAB173:    t4 = (t0 + 4560);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t4, 26U, 6U, 0LL);
    xsi_set_current_line(274, ng0);
    t2 = (t0 + 4624);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(275, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 3920);
    xsi_process_wait(t2, t10);

LAB176:    *((char **)t1) = &&LAB177;
    goto LAB1;

LAB165:    goto LAB164;

LAB167:    goto LAB165;

LAB168:    xsi_size_not_matching(6U, 6U, 0);
    goto LAB169;

LAB170:    xsi_size_not_matching(20U, 20U, 0);
    goto LAB171;

LAB172:    xsi_size_not_matching(6U, 6U, 0);
    goto LAB173;

LAB174:    xsi_set_current_line(288, ng0);
    t2 = (t0 + 8042);
    t7 = (6U != 6U);
    if (t7 == 1)
        goto LAB178;

LAB179:    t4 = (t0 + 4560);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t4, 0U, 6U, 0LL);
    xsi_set_current_line(289, ng0);
    t2 = (t0 + 8048);
    t7 = (20U != 20U);
    if (t7 == 1)
        goto LAB180;

LAB181:    t4 = (t0 + 4560);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 20U);
    xsi_driver_first_trans_delta(t4, 6U, 20U, 0LL);
    xsi_set_current_line(290, ng0);
    t2 = (t0 + 8068);
    t7 = (6U != 6U);
    if (t7 == 1)
        goto LAB182;

LAB183:    t4 = (t0 + 4560);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t4, 26U, 6U, 0LL);
    xsi_set_current_line(291, ng0);
    t2 = (t0 + 4624);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(292, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 3920);
    xsi_process_wait(t2, t10);

LAB186:    *((char **)t1) = &&LAB187;
    goto LAB1;

LAB175:    goto LAB174;

LAB177:    goto LAB175;

LAB178:    xsi_size_not_matching(6U, 6U, 0);
    goto LAB179;

LAB180:    xsi_size_not_matching(20U, 20U, 0);
    goto LAB181;

LAB182:    xsi_size_not_matching(6U, 6U, 0);
    goto LAB183;

LAB184:    xsi_set_current_line(304, ng0);
    t2 = (t0 + 8074);
    t7 = (6U != 6U);
    if (t7 == 1)
        goto LAB188;

LAB189:    t4 = (t0 + 4560);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t4, 0U, 6U, 0LL);
    xsi_set_current_line(305, ng0);
    t2 = (t0 + 8080);
    t7 = (20U != 20U);
    if (t7 == 1)
        goto LAB190;

LAB191:    t4 = (t0 + 4560);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 20U);
    xsi_driver_first_trans_delta(t4, 6U, 20U, 0LL);
    xsi_set_current_line(306, ng0);
    t2 = (t0 + 8100);
    t7 = (6U != 6U);
    if (t7 == 1)
        goto LAB192;

LAB193:    t4 = (t0 + 4560);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t4, 26U, 6U, 0LL);
    xsi_set_current_line(307, ng0);
    t2 = (t0 + 4624);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(308, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 3920);
    xsi_process_wait(t2, t10);

LAB196:    *((char **)t1) = &&LAB197;
    goto LAB1;

LAB185:    goto LAB184;

LAB187:    goto LAB185;

LAB188:    xsi_size_not_matching(6U, 6U, 0);
    goto LAB189;

LAB190:    xsi_size_not_matching(20U, 20U, 0);
    goto LAB191;

LAB192:    xsi_size_not_matching(6U, 6U, 0);
    goto LAB193;

LAB194:    xsi_set_current_line(321, ng0);
    t2 = (t0 + 8106);
    t7 = (6U != 6U);
    if (t7 == 1)
        goto LAB198;

LAB199:    t4 = (t0 + 4560);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t4, 0U, 6U, 0LL);
    xsi_set_current_line(322, ng0);
    t2 = (t0 + 8112);
    t7 = (20U != 20U);
    if (t7 == 1)
        goto LAB200;

LAB201:    t4 = (t0 + 4560);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 20U);
    xsi_driver_first_trans_delta(t4, 6U, 20U, 0LL);
    xsi_set_current_line(323, ng0);
    t2 = (t0 + 8132);
    t7 = (6U != 6U);
    if (t7 == 1)
        goto LAB202;

LAB203:    t4 = (t0 + 4560);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t4, 26U, 6U, 0LL);
    xsi_set_current_line(324, ng0);
    t2 = (t0 + 4624);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(325, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 3920);
    xsi_process_wait(t2, t10);

LAB206:    *((char **)t1) = &&LAB207;
    goto LAB1;

LAB195:    goto LAB194;

LAB197:    goto LAB195;

LAB198:    xsi_size_not_matching(6U, 6U, 0);
    goto LAB199;

LAB200:    xsi_size_not_matching(20U, 20U, 0);
    goto LAB201;

LAB202:    xsi_size_not_matching(6U, 6U, 0);
    goto LAB203;

LAB204:    xsi_set_current_line(327, ng0);

LAB210:    *((char **)t1) = &&LAB211;
    goto LAB1;

LAB205:    goto LAB204;

LAB207:    goto LAB205;

LAB208:    goto LAB2;

LAB209:    goto LAB208;

LAB211:    goto LAB209;

}


extern void work_a_3491362456_2372691052_init()
{
	static char *pe[] = {(void *)work_a_3491362456_2372691052_p_0};
	xsi_register_didat("work_a_3491362456_2372691052", "isim/CONTROL_tb_isim_beh.exe.sim/work/a_3491362456_2372691052.didat");
	xsi_register_executes(pe);
}
