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
static const char *ng0 = "C:/Users/Alex/Desktop/Organosh_real/Phase_1/ALU.vhd";
extern char *IEEE_P_3499444699;
extern char *IEEE_P_2592010699;
extern char *IEEE_P_3620187407;

char *ieee_p_2592010699_sub_1306069469_503743352(char *, char *, char *, char *, char *, char *);
char *ieee_p_2592010699_sub_1735675855_503743352(char *, char *, char *, char *, char *, char *);
char *ieee_p_2592010699_sub_1837678034_503743352(char *, char *, char *, char *);
unsigned char ieee_p_2592010699_sub_2507238156_503743352(char *, unsigned char , unsigned char );
char *ieee_p_2592010699_sub_3798478767_503743352(char *, char *, char *, char *, char *, char *);
char *ieee_p_2592010699_sub_795620321_503743352(char *, char *, char *, char *, char *, char *);
char *ieee_p_3499444699_sub_278355757_3536714472(char *, char *, char *, char *, char *, char *);
char *ieee_p_3499444699_sub_278427631_3536714472(char *, char *, char *, char *, char *, char *);
char *ieee_p_3620187407_sub_767668596_3965413181(char *, char *, char *, char *, char *, char *);


static void work_a_0832606739_3212880686_p_0(char *t0)
{
    char t39[16];
    char t58[16];
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
    int t17;
    char *t18;
    int t20;
    char *t21;
    int t23;
    char *t24;
    int t26;
    char *t27;
    int t29;
    char *t30;
    int t32;
    char *t33;
    int t35;
    char *t36;
    int t38;
    char *t40;
    char *t41;
    char *t42;
    char *t43;
    char *t44;
    char *t45;
    unsigned int t46;
    unsigned int t47;
    unsigned char t48;
    char *t49;
    char *t50;
    char *t51;
    char *t52;
    char *t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t59;
    unsigned char t60;

LAB0:    t1 = (t0 + 3792U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(24, ng0);
    t2 = (t0 + 1352U);
    t3 = *((char **)t2);
    t2 = (t0 + 9235);
    t5 = xsi_mem_cmp(t2, t3, 4U);
    if (t5 == 1)
        goto LAB5;

LAB18:    t6 = (t0 + 9239);
    t8 = xsi_mem_cmp(t6, t3, 4U);
    if (t8 == 1)
        goto LAB6;

LAB19:    t9 = (t0 + 9243);
    t11 = xsi_mem_cmp(t9, t3, 4U);
    if (t11 == 1)
        goto LAB7;

LAB20:    t12 = (t0 + 9247);
    t14 = xsi_mem_cmp(t12, t3, 4U);
    if (t14 == 1)
        goto LAB8;

LAB21:    t15 = (t0 + 9251);
    t17 = xsi_mem_cmp(t15, t3, 4U);
    if (t17 == 1)
        goto LAB9;

LAB22:    t18 = (t0 + 9255);
    t20 = xsi_mem_cmp(t18, t3, 4U);
    if (t20 == 1)
        goto LAB10;

LAB23:    t21 = (t0 + 9259);
    t23 = xsi_mem_cmp(t21, t3, 4U);
    if (t23 == 1)
        goto LAB11;

LAB24:    t24 = (t0 + 9263);
    t26 = xsi_mem_cmp(t24, t3, 4U);
    if (t26 == 1)
        goto LAB12;

LAB25:    t27 = (t0 + 9267);
    t29 = xsi_mem_cmp(t27, t3, 4U);
    if (t29 == 1)
        goto LAB13;

LAB26:    t30 = (t0 + 9271);
    t32 = xsi_mem_cmp(t30, t3, 4U);
    if (t32 == 1)
        goto LAB14;

LAB27:    t33 = (t0 + 9275);
    t35 = xsi_mem_cmp(t33, t3, 4U);
    if (t35 == 1)
        goto LAB15;

LAB28:    t36 = (t0 + 9279);
    t38 = xsi_mem_cmp(t36, t3, 4U);
    if (t38 == 1)
        goto LAB16;

LAB29:
LAB17:    xsi_set_current_line(25, ng0);
    t2 = xsi_get_transient_memory(32U);
    memset(t2, 0, 32U);
    t3 = t2;
    memset(t3, (unsigned char)2, 32U);
    t4 = (t0 + 6040);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 32U);
    xsi_driver_first_trans_fast(t4);

LAB4:    xsi_set_current_line(24, ng0);

LAB57:    t2 = (t0 + 5848);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB58;

LAB1:    return;
LAB5:    xsi_set_current_line(25, ng0);
    t40 = (t0 + 1032U);
    t41 = *((char **)t40);
    t40 = (t0 + 8996U);
    t42 = (t0 + 1192U);
    t43 = *((char **)t42);
    t42 = (t0 + 9012U);
    t44 = ieee_p_3499444699_sub_278355757_3536714472(IEEE_P_3499444699, t39, t41, t40, t43, t42);
    t45 = (t39 + 12U);
    t46 = *((unsigned int *)t45);
    t47 = (1U * t46);
    t48 = (32U != t47);
    if (t48 == 1)
        goto LAB31;

LAB32:    t49 = (t0 + 6040);
    t50 = (t49 + 56U);
    t51 = *((char **)t50);
    t52 = (t51 + 56U);
    t53 = *((char **)t52);
    memcpy(t53, t44, 32U);
    xsi_driver_first_trans_fast(t49);
    goto LAB4;

LAB6:    xsi_set_current_line(25, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 8996U);
    t4 = (t0 + 1192U);
    t6 = *((char **)t4);
    t4 = (t0 + 9012U);
    t7 = ieee_p_3499444699_sub_278427631_3536714472(IEEE_P_3499444699, t39, t3, t2, t6, t4);
    t9 = (t39 + 12U);
    t46 = *((unsigned int *)t9);
    t47 = (1U * t46);
    t48 = (32U != t47);
    if (t48 == 1)
        goto LAB33;

LAB34:    t10 = (t0 + 6040);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    t15 = (t13 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t7, 32U);
    xsi_driver_first_trans_fast(t10);
    goto LAB4;

LAB7:    xsi_set_current_line(25, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 8996U);
    t4 = (t0 + 1192U);
    t6 = *((char **)t4);
    t4 = (t0 + 9012U);
    t7 = ieee_p_2592010699_sub_795620321_503743352(IEEE_P_2592010699, t39, t3, t2, t6, t4);
    t9 = (t39 + 12U);
    t46 = *((unsigned int *)t9);
    t47 = (1U * t46);
    t48 = (32U != t47);
    if (t48 == 1)
        goto LAB35;

LAB36:    t10 = (t0 + 6040);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    t15 = (t13 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t7, 32U);
    xsi_driver_first_trans_fast(t10);
    goto LAB4;

LAB8:    xsi_set_current_line(25, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 8996U);
    t4 = (t0 + 1192U);
    t6 = *((char **)t4);
    t4 = (t0 + 9012U);
    t7 = ieee_p_2592010699_sub_1735675855_503743352(IEEE_P_2592010699, t39, t3, t2, t6, t4);
    t9 = (t39 + 12U);
    t46 = *((unsigned int *)t9);
    t47 = (1U * t46);
    t48 = (32U != t47);
    if (t48 == 1)
        goto LAB37;

LAB38:    t10 = (t0 + 6040);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    t15 = (t13 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t7, 32U);
    xsi_driver_first_trans_fast(t10);
    goto LAB4;

LAB9:    xsi_set_current_line(25, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 8996U);
    t4 = ieee_p_2592010699_sub_1837678034_503743352(IEEE_P_2592010699, t39, t3, t2);
    t6 = (t39 + 12U);
    t46 = *((unsigned int *)t6);
    t47 = (1U * t46);
    t48 = (32U != t47);
    if (t48 == 1)
        goto LAB39;

LAB40:    t7 = (t0 + 6040);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t4, 32U);
    xsi_driver_first_trans_fast(t7);
    goto LAB4;

LAB10:    xsi_set_current_line(25, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 8996U);
    t4 = (t0 + 1192U);
    t6 = *((char **)t4);
    t4 = (t0 + 9012U);
    t7 = ieee_p_2592010699_sub_3798478767_503743352(IEEE_P_2592010699, t39, t3, t2, t6, t4);
    t9 = (t39 + 12U);
    t46 = *((unsigned int *)t9);
    t47 = (1U * t46);
    t48 = (32U != t47);
    if (t48 == 1)
        goto LAB41;

LAB42:    t10 = (t0 + 6040);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    t15 = (t13 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t7, 32U);
    xsi_driver_first_trans_fast(t10);
    goto LAB4;

LAB11:    xsi_set_current_line(25, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 8996U);
    t4 = (t0 + 1192U);
    t6 = *((char **)t4);
    t4 = (t0 + 9012U);
    t7 = ieee_p_2592010699_sub_1306069469_503743352(IEEE_P_2592010699, t39, t3, t2, t6, t4);
    t9 = (t39 + 12U);
    t46 = *((unsigned int *)t9);
    t47 = (1U * t46);
    t48 = (32U != t47);
    if (t48 == 1)
        goto LAB43;

LAB44:    t10 = (t0 + 6040);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    t15 = (t13 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t7, 32U);
    xsi_driver_first_trans_fast(t10);
    goto LAB4;

LAB12:    xsi_set_current_line(25, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t5 = (31 - 31);
    t46 = (t5 * -1);
    t47 = (1U * t46);
    t54 = (0 + t47);
    t2 = (t3 + t54);
    t48 = *((unsigned char *)t2);
    t4 = (t0 + 1032U);
    t6 = *((char **)t4);
    t55 = (31 - 31);
    t56 = (t55 * 1U);
    t57 = (0 + t56);
    t4 = (t6 + t57);
    t9 = ((IEEE_P_2592010699) + 4024);
    t10 = (t58 + 0U);
    t12 = (t10 + 0U);
    *((int *)t12) = 31;
    t12 = (t10 + 4U);
    *((int *)t12) = 1;
    t12 = (t10 + 8U);
    *((int *)t12) = -1;
    t8 = (1 - 31);
    t59 = (t8 * -1);
    t59 = (t59 + 1);
    t12 = (t10 + 12U);
    *((unsigned int *)t12) = t59;
    t7 = xsi_base_array_concat(t7, t39, t9, (char)99, t48, (char)97, t4, t58, (char)101);
    t59 = (1U + 31U);
    t60 = (32U != t59);
    if (t60 == 1)
        goto LAB45;

LAB46:    t12 = (t0 + 6040);
    t13 = (t12 + 56U);
    t15 = *((char **)t13);
    t16 = (t15 + 56U);
    t18 = *((char **)t16);
    memcpy(t18, t7, 32U);
    xsi_driver_first_trans_fast(t12);
    goto LAB4;

LAB13:    xsi_set_current_line(25, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t46 = (31 - 31);
    t47 = (t46 * 1U);
    t54 = (0 + t47);
    t2 = (t3 + t54);
    t6 = ((IEEE_P_2592010699) + 4024);
    t7 = (t58 + 0U);
    t9 = (t7 + 0U);
    *((int *)t9) = 31;
    t9 = (t7 + 4U);
    *((int *)t9) = 1;
    t9 = (t7 + 8U);
    *((int *)t9) = -1;
    t5 = (1 - 31);
    t55 = (t5 * -1);
    t55 = (t55 + 1);
    t9 = (t7 + 12U);
    *((unsigned int *)t9) = t55;
    t4 = xsi_base_array_concat(t4, t39, t6, (char)99, (unsigned char)2, (char)97, t2, t58, (char)101);
    t55 = (1U + 31U);
    t48 = (32U != t55);
    if (t48 == 1)
        goto LAB47;

LAB48:    t9 = (t0 + 6040);
    t10 = (t9 + 56U);
    t12 = *((char **)t10);
    t13 = (t12 + 56U);
    t15 = *((char **)t13);
    memcpy(t15, t4, 32U);
    xsi_driver_first_trans_fast(t9);
    goto LAB4;

LAB14:    xsi_set_current_line(25, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t46 = (31 - 30);
    t47 = (t46 * 1U);
    t54 = (0 + t47);
    t2 = (t3 + t54);
    t6 = ((IEEE_P_2592010699) + 4024);
    t7 = (t58 + 0U);
    t9 = (t7 + 0U);
    *((int *)t9) = 30;
    t9 = (t7 + 4U);
    *((int *)t9) = 0;
    t9 = (t7 + 8U);
    *((int *)t9) = -1;
    t5 = (0 - 30);
    t55 = (t5 * -1);
    t55 = (t55 + 1);
    t9 = (t7 + 12U);
    *((unsigned int *)t9) = t55;
    t4 = xsi_base_array_concat(t4, t39, t6, (char)97, t2, t58, (char)99, (unsigned char)2, (char)101);
    t55 = (31U + 1U);
    t48 = (32U != t55);
    if (t48 == 1)
        goto LAB49;

LAB50:    t9 = (t0 + 6040);
    t10 = (t9 + 56U);
    t12 = *((char **)t10);
    t13 = (t12 + 56U);
    t15 = *((char **)t13);
    memcpy(t15, t4, 32U);
    xsi_driver_first_trans_fast(t9);
    goto LAB4;

LAB15:    xsi_set_current_line(25, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t46 = (31 - 30);
    t47 = (t46 * 1U);
    t54 = (0 + t47);
    t2 = (t3 + t54);
    t4 = (t0 + 1032U);
    t6 = *((char **)t4);
    t5 = (31 - 31);
    t55 = (t5 * -1);
    t56 = (1U * t55);
    t57 = (0 + t56);
    t4 = (t6 + t57);
    t48 = *((unsigned char *)t4);
    t9 = ((IEEE_P_2592010699) + 4024);
    t10 = (t58 + 0U);
    t12 = (t10 + 0U);
    *((int *)t12) = 30;
    t12 = (t10 + 4U);
    *((int *)t12) = 0;
    t12 = (t10 + 8U);
    *((int *)t12) = -1;
    t8 = (0 - 30);
    t59 = (t8 * -1);
    t59 = (t59 + 1);
    t12 = (t10 + 12U);
    *((unsigned int *)t12) = t59;
    t7 = xsi_base_array_concat(t7, t39, t9, (char)97, t2, t58, (char)99, t48, (char)101);
    t59 = (31U + 1U);
    t60 = (32U != t59);
    if (t60 == 1)
        goto LAB51;

LAB52:    t12 = (t0 + 6040);
    t13 = (t12 + 56U);
    t15 = *((char **)t13);
    t16 = (t15 + 56U);
    t18 = *((char **)t16);
    memcpy(t18, t7, 32U);
    xsi_driver_first_trans_fast(t12);
    goto LAB4;

LAB16:    xsi_set_current_line(25, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t5 = (0 - 31);
    t46 = (t5 * -1);
    t47 = (1U * t46);
    t54 = (0 + t47);
    t2 = (t3 + t54);
    t48 = *((unsigned char *)t2);
    t4 = (t0 + 1032U);
    t6 = *((char **)t4);
    t55 = (31 - 31);
    t56 = (t55 * 1U);
    t57 = (0 + t56);
    t4 = (t6 + t57);
    t9 = ((IEEE_P_2592010699) + 4024);
    t10 = (t58 + 0U);
    t12 = (t10 + 0U);
    *((int *)t12) = 31;
    t12 = (t10 + 4U);
    *((int *)t12) = 1;
    t12 = (t10 + 8U);
    *((int *)t12) = -1;
    t8 = (1 - 31);
    t59 = (t8 * -1);
    t59 = (t59 + 1);
    t12 = (t10 + 12U);
    *((unsigned int *)t12) = t59;
    t7 = xsi_base_array_concat(t7, t39, t9, (char)99, t48, (char)97, t4, t58, (char)101);
    t59 = (1U + 31U);
    t60 = (32U != t59);
    if (t60 == 1)
        goto LAB53;

LAB54:    t12 = (t0 + 6040);
    t13 = (t12 + 56U);
    t15 = *((char **)t13);
    t16 = (t15 + 56U);
    t18 = *((char **)t16);
    memcpy(t18, t7, 32U);
    xsi_driver_first_trans_fast(t12);
    goto LAB4;

LAB30:;
LAB31:    xsi_size_not_matching(32U, t47, 0);
    goto LAB32;

LAB33:    xsi_size_not_matching(32U, t47, 0);
    goto LAB34;

LAB35:    xsi_size_not_matching(32U, t47, 0);
    goto LAB36;

LAB37:    xsi_size_not_matching(32U, t47, 0);
    goto LAB38;

LAB39:    xsi_size_not_matching(32U, t47, 0);
    goto LAB40;

LAB41:    xsi_size_not_matching(32U, t47, 0);
    goto LAB42;

LAB43:    xsi_size_not_matching(32U, t47, 0);
    goto LAB44;

LAB45:    xsi_size_not_matching(32U, t59, 0);
    goto LAB46;

LAB47:    xsi_size_not_matching(32U, t55, 0);
    goto LAB48;

LAB49:    xsi_size_not_matching(32U, t55, 0);
    goto LAB50;

LAB51:    xsi_size_not_matching(32U, t59, 0);
    goto LAB52;

LAB53:    xsi_size_not_matching(32U, t59, 0);
    goto LAB54;

LAB55:    t3 = (t0 + 5848);
    *((int *)t3) = 0;
    goto LAB2;

LAB56:    goto LAB55;

LAB58:    goto LAB56;

}

static void work_a_0832606739_3212880686_p_1(char *t0)
{
    char t5[16];
    char *t1;
    char *t2;
    char *t3;
    char *t6;
    char *t7;
    int t8;
    unsigned int t9;
    unsigned char t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;

LAB0:    xsi_set_current_line(40, ng0);
    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t1 = (t0 + 9060U);
    t3 = (t0 + 9283);
    t6 = (t5 + 0U);
    t7 = (t6 + 0U);
    *((int *)t7) = 0;
    t7 = (t6 + 4U);
    *((int *)t7) = 31;
    t7 = (t6 + 8U);
    *((int *)t7) = 1;
    t8 = (31 - 0);
    t9 = (t8 * 1);
    t9 = (t9 + 1);
    t7 = (t6 + 12U);
    *((unsigned int *)t7) = t9;
    t10 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t2, t1, t3, t5);
    if (t10 != 0)
        goto LAB3;

LAB4:
LAB5:    t15 = (t0 + 6104);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    *((unsigned char *)t19) = (unsigned char)2;
    xsi_driver_first_trans_fast(t15);

LAB2:    t20 = (t0 + 5864);
    *((int *)t20) = 1;

LAB1:    return;
LAB3:    t7 = (t0 + 6104);
    t11 = (t7 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = (unsigned char)3;
    xsi_driver_first_trans_fast(t7);
    goto LAB2;

LAB6:    goto LAB2;

}

static void work_a_0832606739_3212880686_p_2(char *t0)
{
    int64 t1;
    char *t2;
    char *t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    xsi_set_current_line(41, ng0);

LAB3:    t1 = (10 * 1000LL);
    t2 = (t0 + 2472U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t2 = (t0 + 6168);
    t5 = (t2 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = t4;
    xsi_driver_first_trans_delta(t2, 0U, 1, t1);
    t9 = (t0 + 6168);
    xsi_driver_intertial_reject(t9, t1, t1);

LAB2:    t10 = (t0 + 5880);
    *((int *)t10) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0832606739_3212880686_p_3(char *t0)
{
    char t22[16];
    char t67[16];
    unsigned char t1;
    char *t2;
    char *t3;
    int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned char t8;
    char *t9;
    char *t10;
    int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned char t15;
    unsigned char t16;
    unsigned char t17;
    char *t18;
    char *t19;
    char *t20;
    char *t23;
    char *t24;
    int t25;
    unsigned int t26;
    unsigned char t27;
    char *t28;
    int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned char t32;
    char *t33;
    char *t34;
    int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned char t39;
    unsigned char t40;
    char *t41;
    char *t42;
    char *t43;
    char *t44;
    char *t45;
    unsigned char t46;
    char *t47;
    char *t48;
    int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned char t53;
    char *t54;
    char *t55;
    int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned char t60;
    unsigned char t61;
    unsigned char t62;
    char *t63;
    char *t64;
    char *t65;
    char *t68;
    char *t69;
    int t70;
    unsigned int t71;
    unsigned char t72;
    char *t73;
    int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned char t77;
    char *t78;
    char *t79;
    int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    unsigned char t84;
    unsigned char t85;
    char *t86;
    char *t87;
    char *t88;
    char *t89;
    char *t90;
    char *t91;
    char *t92;
    char *t93;
    char *t94;
    char *t95;
    char *t96;

LAB0:    xsi_set_current_line(44, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t4 = (31 - 31);
    t5 = (t4 * -1);
    t6 = (1U * t5);
    t7 = (0 + t6);
    t2 = (t3 + t7);
    t8 = *((unsigned char *)t2);
    t9 = (t0 + 1192U);
    t10 = *((char **)t9);
    t11 = (31 - 31);
    t12 = (t11 * -1);
    t13 = (1U * t12);
    t14 = (0 + t13);
    t9 = (t10 + t14);
    t15 = *((unsigned char *)t9);
    t16 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t8, t15);
    t17 = (t16 == (unsigned char)2);
    if (t17 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB3;

LAB4:    t47 = (t0 + 1032U);
    t48 = *((char **)t47);
    t49 = (31 - 31);
    t50 = (t49 * -1);
    t51 = (1U * t50);
    t52 = (0 + t51);
    t47 = (t48 + t52);
    t53 = *((unsigned char *)t47);
    t54 = (t0 + 1192U);
    t55 = *((char **)t54);
    t56 = (31 - 31);
    t57 = (t56 * -1);
    t58 = (1U * t57);
    t59 = (0 + t58);
    t54 = (t55 + t59);
    t60 = *((unsigned char *)t54);
    t61 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t53, t60);
    t62 = (t61 == (unsigned char)3);
    if (t62 == 1)
        goto LAB10;

LAB11:    t46 = (unsigned char)0;

LAB12:    if (t46 != 0)
        goto LAB8;

LAB9:
LAB13:    t91 = (t0 + 6232);
    t92 = (t91 + 56U);
    t93 = *((char **)t92);
    t94 = (t93 + 56U);
    t95 = *((char **)t94);
    *((unsigned char *)t95) = (unsigned char)2;
    xsi_driver_first_trans_fast(t91);

LAB2:    t96 = (t0 + 5896);
    *((int *)t96) = 1;

LAB1:    return;
LAB3:    t24 = (t0 + 1032U);
    t28 = *((char **)t24);
    t29 = (31 - 31);
    t26 = (t29 * -1);
    t30 = (1U * t26);
    t31 = (0 + t30);
    t24 = (t28 + t31);
    t32 = *((unsigned char *)t24);
    t33 = (t0 + 2152U);
    t34 = *((char **)t33);
    t35 = (31 - 31);
    t36 = (t35 * -1);
    t37 = (1U * t36);
    t38 = (0 + t37);
    t33 = (t34 + t38);
    t39 = *((unsigned char *)t33);
    t40 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t32, t39);
    t41 = (t0 + 6232);
    t42 = (t41 + 56U);
    t43 = *((char **)t42);
    t44 = (t43 + 56U);
    t45 = *((char **)t44);
    *((unsigned char *)t45) = t40;
    xsi_driver_first_trans_fast(t41);
    goto LAB2;

LAB5:    t18 = (t0 + 1352U);
    t19 = *((char **)t18);
    t18 = (t0 + 9028U);
    t20 = (t0 + 9315);
    t23 = (t22 + 0U);
    t24 = (t23 + 0U);
    *((int *)t24) = 0;
    t24 = (t23 + 4U);
    *((int *)t24) = 3;
    t24 = (t23 + 8U);
    *((int *)t24) = 1;
    t25 = (3 - 0);
    t26 = (t25 * 1);
    t26 = (t26 + 1);
    t24 = (t23 + 12U);
    *((unsigned int *)t24) = t26;
    t27 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t19, t18, t20, t22);
    t1 = t27;
    goto LAB7;

LAB8:    t69 = (t0 + 1032U);
    t73 = *((char **)t69);
    t74 = (31 - 31);
    t71 = (t74 * -1);
    t75 = (1U * t71);
    t76 = (0 + t75);
    t69 = (t73 + t76);
    t77 = *((unsigned char *)t69);
    t78 = (t0 + 2152U);
    t79 = *((char **)t78);
    t80 = (31 - 31);
    t81 = (t80 * -1);
    t82 = (1U * t81);
    t83 = (0 + t82);
    t78 = (t79 + t83);
    t84 = *((unsigned char *)t78);
    t85 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t77, t84);
    t86 = (t0 + 6232);
    t87 = (t86 + 56U);
    t88 = *((char **)t87);
    t89 = (t88 + 56U);
    t90 = *((char **)t89);
    *((unsigned char *)t90) = t85;
    xsi_driver_first_trans_fast(t86);
    goto LAB2;

LAB10:    t63 = (t0 + 1352U);
    t64 = *((char **)t63);
    t63 = (t0 + 9028U);
    t65 = (t0 + 9319);
    t68 = (t67 + 0U);
    t69 = (t68 + 0U);
    *((int *)t69) = 0;
    t69 = (t68 + 4U);
    *((int *)t69) = 3;
    t69 = (t68 + 8U);
    *((int *)t69) = 1;
    t70 = (3 - 0);
    t71 = (t70 * 1);
    t71 = (t71 + 1);
    t69 = (t68 + 12U);
    *((unsigned int *)t69) = t71;
    t72 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t64, t63, t65, t67);
    t46 = t72;
    goto LAB12;

LAB14:    goto LAB2;

}

static void work_a_0832606739_3212880686_p_4(char *t0)
{
    int64 t1;
    char *t2;
    char *t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    xsi_set_current_line(47, ng0);

LAB3:    t1 = (10 * 1000LL);
    t2 = (t0 + 2632U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t2 = (t0 + 6296);
    t5 = (t2 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = t4;
    xsi_driver_first_trans_delta(t2, 0U, 1, t1);
    t9 = (t0 + 6296);
    xsi_driver_intertial_reject(t9, t1, t1);

LAB2:    t10 = (t0 + 5912);
    *((int *)t10) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0832606739_3212880686_p_5(char *t0)
{
    char t6[16];
    char t9[16];
    char t14[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    int t5;
    char *t7;
    char *t8;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    unsigned int t19;
    unsigned int t20;
    unsigned char t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;

LAB0:    t1 = (t0 + 5032U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(50, ng0);
    t2 = (t0 + 1352U);
    t3 = *((char **)t2);
    t2 = (t0 + 9323);
    t5 = xsi_mem_cmp(t2, t3, 4U);
    if (t5 == 1)
        goto LAB5;

LAB7:
LAB6:    xsi_set_current_line(51, ng0);
    t2 = xsi_get_transient_memory(33U);
    memset(t2, 0, 33U);
    t3 = t2;
    memset(t3, (unsigned char)2, 33U);
    t4 = (t0 + 6360);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    t10 = (t8 + 56U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 33U);
    xsi_driver_first_trans_fast(t4);

LAB4:    xsi_set_current_line(50, ng0);

LAB13:    t2 = (t0 + 5928);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB14;

LAB1:    return;
LAB5:    xsi_set_current_line(51, ng0);
    t7 = (t0 + 1032U);
    t8 = *((char **)t7);
    t10 = ((IEEE_P_2592010699) + 4024);
    t11 = (t0 + 8996U);
    t7 = xsi_base_array_concat(t7, t9, t10, (char)99, (unsigned char)2, (char)97, t8, t11, (char)101);
    t12 = (t0 + 1192U);
    t13 = *((char **)t12);
    t15 = ((IEEE_P_2592010699) + 4024);
    t16 = (t0 + 9012U);
    t12 = xsi_base_array_concat(t12, t14, t15, (char)99, (unsigned char)2, (char)97, t13, t16, (char)101);
    t17 = ieee_p_3620187407_sub_767668596_3965413181(IEEE_P_3620187407, t6, t7, t9, t12, t14);
    t18 = (t6 + 12U);
    t19 = *((unsigned int *)t18);
    t20 = (1U * t19);
    t21 = (33U != t20);
    if (t21 == 1)
        goto LAB9;

LAB10:    t22 = (t0 + 6360);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    memcpy(t26, t17, 33U);
    xsi_driver_first_trans_fast(t22);
    goto LAB4;

LAB8:;
LAB9:    xsi_size_not_matching(33U, t20, 0);
    goto LAB10;

LAB11:    t3 = (t0 + 5928);
    *((int *)t3) = 0;
    goto LAB2;

LAB12:    goto LAB11;

LAB14:    goto LAB12;

}

static void work_a_0832606739_3212880686_p_6(char *t0)
{
    int64 t1;
    char *t2;
    char *t3;
    int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned char t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;

LAB0:    xsi_set_current_line(53, ng0);

LAB3:    t1 = (10 * 1000LL);
    t2 = (t0 + 2312U);
    t3 = *((char **)t2);
    t4 = (32 - 32);
    t5 = (t4 * -1);
    t6 = (1U * t5);
    t7 = (0 + t6);
    t2 = (t3 + t7);
    t8 = *((unsigned char *)t2);
    t9 = (t0 + 6424);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    *((unsigned char *)t13) = t8;
    xsi_driver_first_trans_delta(t9, 0U, 1, t1);
    t14 = (t0 + 6424);
    xsi_driver_intertial_reject(t14, t1, t1);

LAB2:    t15 = (t0 + 5944);
    *((int *)t15) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0832606739_3212880686_p_7(char *t0)
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

LAB0:    xsi_set_current_line(56, ng0);

LAB3:    t1 = (10 * 1000LL);
    t2 = (t0 + 2152U);
    t3 = *((char **)t2);
    t2 = (t0 + 6488);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t3, 32U);
    xsi_driver_first_trans_delta(t2, 0U, 32U, t1);
    t8 = (t0 + 6488);
    xsi_driver_intertial_reject(t8, t1, t1);

LAB2:    t9 = (t0 + 5960);
    *((int *)t9) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_0832606739_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0832606739_3212880686_p_0,(void *)work_a_0832606739_3212880686_p_1,(void *)work_a_0832606739_3212880686_p_2,(void *)work_a_0832606739_3212880686_p_3,(void *)work_a_0832606739_3212880686_p_4,(void *)work_a_0832606739_3212880686_p_5,(void *)work_a_0832606739_3212880686_p_6,(void *)work_a_0832606739_3212880686_p_7};
	xsi_register_didat("work_a_0832606739_3212880686", "isim/DATAPATH_tb_isim_beh.exe.sim/work/a_0832606739_3212880686.didat");
	xsi_register_executes(pe);
}
