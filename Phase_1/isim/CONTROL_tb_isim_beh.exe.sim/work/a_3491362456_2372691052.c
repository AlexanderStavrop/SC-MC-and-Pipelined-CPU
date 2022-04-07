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
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    int64 t10;

LAB0:    t1 = (t0 + 3952U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(68, ng0);
    t2 = (t0 + 7347);
    t4 = (6U != 6U);
    if (t4 == 1)
        goto LAB4;

LAB5:    t5 = (t0 + 4336);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t5, 0U, 6U, 0LL);
    xsi_set_current_line(69, ng0);
    t2 = (t0 + 7353);
    t4 = (20U != 20U);
    if (t4 == 1)
        goto LAB6;

LAB7:    t5 = (t0 + 4336);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 20U);
    xsi_driver_first_trans_delta(t5, 6U, 20U, 0LL);
    xsi_set_current_line(70, ng0);
    t2 = (t0 + 4400);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(78, ng0);
    t2 = (t0 + 7373);
    t4 = (6U != 6U);
    if (t4 == 1)
        goto LAB8;

LAB9:    t5 = (t0 + 4336);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t5, 26U, 6U, 0LL);
    xsi_set_current_line(79, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 3760);
    xsi_process_wait(t2, t10);

LAB12:    *((char **)t1) = &&LAB13;

LAB1:    return;
LAB4:    xsi_size_not_matching(6U, 6U, 0);
    goto LAB5;

LAB6:    xsi_size_not_matching(20U, 20U, 0);
    goto LAB7;

LAB8:    xsi_size_not_matching(6U, 6U, 0);
    goto LAB9;

LAB10:    xsi_set_current_line(81, ng0);
    t2 = (t0 + 7379);
    t4 = (6U != 6U);
    if (t4 == 1)
        goto LAB14;

LAB15:    t5 = (t0 + 4336);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t5, 26U, 6U, 0LL);
    xsi_set_current_line(82, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 3760);
    xsi_process_wait(t2, t10);

LAB18:    *((char **)t1) = &&LAB19;
    goto LAB1;

LAB11:    goto LAB10;

LAB13:    goto LAB11;

LAB14:    xsi_size_not_matching(6U, 6U, 0);
    goto LAB15;

LAB16:    xsi_set_current_line(84, ng0);
    t2 = (t0 + 7385);
    t4 = (6U != 6U);
    if (t4 == 1)
        goto LAB20;

LAB21:    t5 = (t0 + 4336);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t5, 26U, 6U, 0LL);
    xsi_set_current_line(85, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 3760);
    xsi_process_wait(t2, t10);

LAB24:    *((char **)t1) = &&LAB25;
    goto LAB1;

LAB17:    goto LAB16;

LAB19:    goto LAB17;

LAB20:    xsi_size_not_matching(6U, 6U, 0);
    goto LAB21;

LAB22:    xsi_set_current_line(87, ng0);
    t2 = (t0 + 7391);
    t4 = (6U != 6U);
    if (t4 == 1)
        goto LAB26;

LAB27:    t5 = (t0 + 4336);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t5, 26U, 6U, 0LL);
    xsi_set_current_line(88, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 3760);
    xsi_process_wait(t2, t10);

LAB30:    *((char **)t1) = &&LAB31;
    goto LAB1;

LAB23:    goto LAB22;

LAB25:    goto LAB23;

LAB26:    xsi_size_not_matching(6U, 6U, 0);
    goto LAB27;

LAB28:    xsi_set_current_line(90, ng0);
    t2 = (t0 + 7397);
    t4 = (6U != 6U);
    if (t4 == 1)
        goto LAB32;

LAB33:    t5 = (t0 + 4336);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t5, 26U, 6U, 0LL);
    xsi_set_current_line(91, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 3760);
    xsi_process_wait(t2, t10);

LAB36:    *((char **)t1) = &&LAB37;
    goto LAB1;

LAB29:    goto LAB28;

LAB31:    goto LAB29;

LAB32:    xsi_size_not_matching(6U, 6U, 0);
    goto LAB33;

LAB34:    xsi_set_current_line(93, ng0);
    t2 = (t0 + 7403);
    t4 = (6U != 6U);
    if (t4 == 1)
        goto LAB38;

LAB39:    t5 = (t0 + 4336);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t5, 26U, 6U, 0LL);
    xsi_set_current_line(94, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 3760);
    xsi_process_wait(t2, t10);

LAB42:    *((char **)t1) = &&LAB43;
    goto LAB1;

LAB35:    goto LAB34;

LAB37:    goto LAB35;

LAB38:    xsi_size_not_matching(6U, 6U, 0);
    goto LAB39;

LAB40:    xsi_set_current_line(96, ng0);
    t2 = (t0 + 7409);
    t4 = (6U != 6U);
    if (t4 == 1)
        goto LAB44;

LAB45:    t5 = (t0 + 4336);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t5, 26U, 6U, 0LL);
    xsi_set_current_line(97, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 3760);
    xsi_process_wait(t2, t10);

LAB48:    *((char **)t1) = &&LAB49;
    goto LAB1;

LAB41:    goto LAB40;

LAB43:    goto LAB41;

LAB44:    xsi_size_not_matching(6U, 6U, 0);
    goto LAB45;

LAB46:    xsi_set_current_line(99, ng0);
    t2 = (t0 + 7415);
    t4 = (6U != 6U);
    if (t4 == 1)
        goto LAB50;

LAB51:    t5 = (t0 + 4336);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t5, 26U, 6U, 0LL);
    xsi_set_current_line(100, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 3760);
    xsi_process_wait(t2, t10);

LAB54:    *((char **)t1) = &&LAB55;
    goto LAB1;

LAB47:    goto LAB46;

LAB49:    goto LAB47;

LAB50:    xsi_size_not_matching(6U, 6U, 0);
    goto LAB51;

LAB52:    xsi_set_current_line(102, ng0);
    t2 = (t0 + 7421);
    t4 = (6U != 6U);
    if (t4 == 1)
        goto LAB56;

LAB57:    t5 = (t0 + 4336);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t5, 26U, 6U, 0LL);
    xsi_set_current_line(103, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 3760);
    xsi_process_wait(t2, t10);

LAB60:    *((char **)t1) = &&LAB61;
    goto LAB1;

LAB53:    goto LAB52;

LAB55:    goto LAB53;

LAB56:    xsi_size_not_matching(6U, 6U, 0);
    goto LAB57;

LAB58:    xsi_set_current_line(105, ng0);
    t2 = (t0 + 7427);
    t4 = (6U != 6U);
    if (t4 == 1)
        goto LAB62;

LAB63:    t5 = (t0 + 4336);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t5, 26U, 6U, 0LL);
    xsi_set_current_line(106, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 3760);
    xsi_process_wait(t2, t10);

LAB66:    *((char **)t1) = &&LAB67;
    goto LAB1;

LAB59:    goto LAB58;

LAB61:    goto LAB59;

LAB62:    xsi_size_not_matching(6U, 6U, 0);
    goto LAB63;

LAB64:    xsi_set_current_line(108, ng0);
    t2 = (t0 + 7433);
    t4 = (6U != 6U);
    if (t4 == 1)
        goto LAB68;

LAB69:    t5 = (t0 + 4336);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t5, 26U, 6U, 0LL);
    xsi_set_current_line(109, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 3760);
    xsi_process_wait(t2, t10);

LAB72:    *((char **)t1) = &&LAB73;
    goto LAB1;

LAB65:    goto LAB64;

LAB67:    goto LAB65;

LAB68:    xsi_size_not_matching(6U, 6U, 0);
    goto LAB69;

LAB70:    xsi_set_current_line(111, ng0);
    t2 = (t0 + 7439);
    t4 = (6U != 6U);
    if (t4 == 1)
        goto LAB74;

LAB75:    t5 = (t0 + 4336);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t5, 26U, 6U, 0LL);
    xsi_set_current_line(112, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 3760);
    xsi_process_wait(t2, t10);

LAB78:    *((char **)t1) = &&LAB79;
    goto LAB1;

LAB71:    goto LAB70;

LAB73:    goto LAB71;

LAB74:    xsi_size_not_matching(6U, 6U, 0);
    goto LAB75;

LAB76:    xsi_set_current_line(125, ng0);
    t2 = (t0 + 7445);
    t4 = (6U != 6U);
    if (t4 == 1)
        goto LAB80;

LAB81:    t5 = (t0 + 4336);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t5, 0U, 6U, 0LL);
    xsi_set_current_line(126, ng0);
    t2 = (t0 + 7451);
    t4 = (20U != 20U);
    if (t4 == 1)
        goto LAB82;

LAB83:    t5 = (t0 + 4336);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 20U);
    xsi_driver_first_trans_delta(t5, 6U, 20U, 0LL);
    xsi_set_current_line(127, ng0);
    t2 = (t0 + 7471);
    t4 = (6U != 6U);
    if (t4 == 1)
        goto LAB84;

LAB85:    t5 = (t0 + 4336);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t5, 26U, 6U, 0LL);
    xsi_set_current_line(128, ng0);
    t2 = (t0 + 4400);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(129, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 3760);
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

LAB86:    xsi_set_current_line(142, ng0);
    t2 = (t0 + 7477);
    t4 = (6U != 6U);
    if (t4 == 1)
        goto LAB90;

LAB91:    t5 = (t0 + 4336);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t5, 0U, 6U, 0LL);
    xsi_set_current_line(143, ng0);
    t2 = (t0 + 7483);
    t4 = (20U != 20U);
    if (t4 == 1)
        goto LAB92;

LAB93:    t5 = (t0 + 4336);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 20U);
    xsi_driver_first_trans_delta(t5, 6U, 20U, 0LL);
    xsi_set_current_line(144, ng0);
    t2 = (t0 + 7503);
    t4 = (6U != 6U);
    if (t4 == 1)
        goto LAB94;

LAB95:    t5 = (t0 + 4336);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t5, 26U, 6U, 0LL);
    xsi_set_current_line(145, ng0);
    t2 = (t0 + 4400);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(146, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 3760);
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

LAB96:    xsi_set_current_line(159, ng0);
    t2 = (t0 + 7509);
    t4 = (6U != 6U);
    if (t4 == 1)
        goto LAB100;

LAB101:    t5 = (t0 + 4336);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t5, 0U, 6U, 0LL);
    xsi_set_current_line(160, ng0);
    t2 = (t0 + 7515);
    t4 = (20U != 20U);
    if (t4 == 1)
        goto LAB102;

LAB103:    t5 = (t0 + 4336);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 20U);
    xsi_driver_first_trans_delta(t5, 6U, 20U, 0LL);
    xsi_set_current_line(161, ng0);
    t2 = (t0 + 7535);
    t4 = (6U != 6U);
    if (t4 == 1)
        goto LAB104;

LAB105:    t5 = (t0 + 4336);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t5, 26U, 6U, 0LL);
    xsi_set_current_line(162, ng0);
    t2 = (t0 + 4400);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(163, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 3760);
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

LAB106:    xsi_set_current_line(176, ng0);
    t2 = (t0 + 7541);
    t4 = (6U != 6U);
    if (t4 == 1)
        goto LAB110;

LAB111:    t5 = (t0 + 4336);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t5, 0U, 6U, 0LL);
    xsi_set_current_line(177, ng0);
    t2 = (t0 + 7547);
    t4 = (20U != 20U);
    if (t4 == 1)
        goto LAB112;

LAB113:    t5 = (t0 + 4336);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 20U);
    xsi_driver_first_trans_delta(t5, 6U, 20U, 0LL);
    xsi_set_current_line(178, ng0);
    t2 = (t0 + 7567);
    t4 = (6U != 6U);
    if (t4 == 1)
        goto LAB114;

LAB115:    t5 = (t0 + 4336);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t5, 26U, 6U, 0LL);
    xsi_set_current_line(179, ng0);
    t2 = (t0 + 4400);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(180, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 3760);
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

LAB116:    xsi_set_current_line(193, ng0);
    t2 = (t0 + 7573);
    t4 = (6U != 6U);
    if (t4 == 1)
        goto LAB120;

LAB121:    t5 = (t0 + 4336);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t5, 0U, 6U, 0LL);
    xsi_set_current_line(194, ng0);
    t2 = (t0 + 7579);
    t4 = (20U != 20U);
    if (t4 == 1)
        goto LAB122;

LAB123:    t5 = (t0 + 4336);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 20U);
    xsi_driver_first_trans_delta(t5, 6U, 20U, 0LL);
    xsi_set_current_line(195, ng0);
    t2 = (t0 + 7599);
    t4 = (6U != 6U);
    if (t4 == 1)
        goto LAB124;

LAB125:    t5 = (t0 + 4336);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t5, 26U, 6U, 0LL);
    xsi_set_current_line(196, ng0);
    t2 = (t0 + 4400);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(197, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 3760);
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

LAB126:    xsi_set_current_line(210, ng0);
    t2 = (t0 + 7605);
    t4 = (6U != 6U);
    if (t4 == 1)
        goto LAB130;

LAB131:    t5 = (t0 + 4336);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t5, 0U, 6U, 0LL);
    xsi_set_current_line(211, ng0);
    t2 = (t0 + 7611);
    t4 = (20U != 20U);
    if (t4 == 1)
        goto LAB132;

LAB133:    t5 = (t0 + 4336);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 20U);
    xsi_driver_first_trans_delta(t5, 6U, 20U, 0LL);
    xsi_set_current_line(212, ng0);
    t2 = (t0 + 7631);
    t4 = (6U != 6U);
    if (t4 == 1)
        goto LAB134;

LAB135:    t5 = (t0 + 4336);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t5, 26U, 6U, 0LL);
    xsi_set_current_line(213, ng0);
    t2 = (t0 + 4400);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(214, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 3760);
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

LAB136:    xsi_set_current_line(227, ng0);
    t2 = (t0 + 7637);
    t4 = (6U != 6U);
    if (t4 == 1)
        goto LAB140;

LAB141:    t5 = (t0 + 4336);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t5, 0U, 6U, 0LL);
    xsi_set_current_line(228, ng0);
    t2 = (t0 + 7643);
    t4 = (20U != 20U);
    if (t4 == 1)
        goto LAB142;

LAB143:    t5 = (t0 + 4336);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 20U);
    xsi_driver_first_trans_delta(t5, 6U, 20U, 0LL);
    xsi_set_current_line(229, ng0);
    t2 = (t0 + 7663);
    t4 = (6U != 6U);
    if (t4 == 1)
        goto LAB144;

LAB145:    t5 = (t0 + 4336);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t5, 26U, 6U, 0LL);
    xsi_set_current_line(230, ng0);
    t2 = (t0 + 4400);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(231, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 3760);
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

LAB146:    xsi_set_current_line(233, ng0);
    t2 = (t0 + 4400);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(234, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 3760);
    xsi_process_wait(t2, t10);

LAB152:    *((char **)t1) = &&LAB153;
    goto LAB1;

LAB147:    goto LAB146;

LAB149:    goto LAB147;

LAB150:    xsi_set_current_line(247, ng0);
    t2 = (t0 + 7669);
    t4 = (6U != 6U);
    if (t4 == 1)
        goto LAB154;

LAB155:    t5 = (t0 + 4336);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t5, 0U, 6U, 0LL);
    xsi_set_current_line(248, ng0);
    t2 = (t0 + 7675);
    t4 = (20U != 20U);
    if (t4 == 1)
        goto LAB156;

LAB157:    t5 = (t0 + 4336);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 20U);
    xsi_driver_first_trans_delta(t5, 6U, 20U, 0LL);
    xsi_set_current_line(249, ng0);
    t2 = (t0 + 7695);
    t4 = (6U != 6U);
    if (t4 == 1)
        goto LAB158;

LAB159:    t5 = (t0 + 4336);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t5, 26U, 6U, 0LL);
    xsi_set_current_line(250, ng0);
    t2 = (t0 + 4400);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(251, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 3760);
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

LAB160:    xsi_set_current_line(253, ng0);
    t2 = (t0 + 4400);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(254, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 3760);
    xsi_process_wait(t2, t10);

LAB166:    *((char **)t1) = &&LAB167;
    goto LAB1;

LAB161:    goto LAB160;

LAB163:    goto LAB161;

LAB164:    xsi_set_current_line(267, ng0);
    t2 = (t0 + 7701);
    t4 = (6U != 6U);
    if (t4 == 1)
        goto LAB168;

LAB169:    t5 = (t0 + 4336);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t5, 0U, 6U, 0LL);
    xsi_set_current_line(268, ng0);
    t2 = (t0 + 7707);
    t4 = (20U != 20U);
    if (t4 == 1)
        goto LAB170;

LAB171:    t5 = (t0 + 4336);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 20U);
    xsi_driver_first_trans_delta(t5, 6U, 20U, 0LL);
    xsi_set_current_line(269, ng0);
    t2 = (t0 + 7727);
    t4 = (6U != 6U);
    if (t4 == 1)
        goto LAB172;

LAB173:    t5 = (t0 + 4336);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t5, 26U, 6U, 0LL);
    xsi_set_current_line(270, ng0);
    t2 = (t0 + 4400);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(271, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 3760);
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

LAB174:    xsi_set_current_line(284, ng0);
    t2 = (t0 + 7733);
    t4 = (6U != 6U);
    if (t4 == 1)
        goto LAB178;

LAB179:    t5 = (t0 + 4336);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t5, 0U, 6U, 0LL);
    xsi_set_current_line(285, ng0);
    t2 = (t0 + 7739);
    t4 = (20U != 20U);
    if (t4 == 1)
        goto LAB180;

LAB181:    t5 = (t0 + 4336);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 20U);
    xsi_driver_first_trans_delta(t5, 6U, 20U, 0LL);
    xsi_set_current_line(286, ng0);
    t2 = (t0 + 7759);
    t4 = (6U != 6U);
    if (t4 == 1)
        goto LAB182;

LAB183:    t5 = (t0 + 4336);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t5, 26U, 6U, 0LL);
    xsi_set_current_line(287, ng0);
    t2 = (t0 + 4400);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(288, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 3760);
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

LAB184:    xsi_set_current_line(300, ng0);
    t2 = (t0 + 7765);
    t4 = (6U != 6U);
    if (t4 == 1)
        goto LAB188;

LAB189:    t5 = (t0 + 4336);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t5, 0U, 6U, 0LL);
    xsi_set_current_line(301, ng0);
    t2 = (t0 + 7771);
    t4 = (20U != 20U);
    if (t4 == 1)
        goto LAB190;

LAB191:    t5 = (t0 + 4336);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 20U);
    xsi_driver_first_trans_delta(t5, 6U, 20U, 0LL);
    xsi_set_current_line(302, ng0);
    t2 = (t0 + 7791);
    t4 = (6U != 6U);
    if (t4 == 1)
        goto LAB192;

LAB193:    t5 = (t0 + 4336);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t5, 26U, 6U, 0LL);
    xsi_set_current_line(303, ng0);
    t2 = (t0 + 4400);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(304, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 3760);
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

LAB194:    xsi_set_current_line(317, ng0);
    t2 = (t0 + 7797);
    t4 = (6U != 6U);
    if (t4 == 1)
        goto LAB198;

LAB199:    t5 = (t0 + 4336);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t5, 0U, 6U, 0LL);
    xsi_set_current_line(318, ng0);
    t2 = (t0 + 7803);
    t4 = (20U != 20U);
    if (t4 == 1)
        goto LAB200;

LAB201:    t5 = (t0 + 4336);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 20U);
    xsi_driver_first_trans_delta(t5, 6U, 20U, 0LL);
    xsi_set_current_line(319, ng0);
    t2 = (t0 + 7823);
    t4 = (6U != 6U);
    if (t4 == 1)
        goto LAB202;

LAB203:    t5 = (t0 + 4336);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 6U);
    xsi_driver_first_trans_delta(t5, 26U, 6U, 0LL);
    xsi_set_current_line(320, ng0);
    t2 = (t0 + 4400);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(321, ng0);
    t10 = (100 * 1000LL);
    t2 = (t0 + 3760);
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

LAB204:    xsi_set_current_line(323, ng0);

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
