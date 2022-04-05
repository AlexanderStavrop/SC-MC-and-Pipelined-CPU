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


static void work_a_0832606739_3212880686_p_0(char *t0)
{
    char t39[16];
    char t58[16];
    char t61[16];
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
    char *t19;
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

LAB0:    t1 = (t0 + 3632U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(23, ng0);
    t2 = (t0 + 1352U);
    t3 = *((char **)t2);
    t2 = (t0 + 8626);
    t5 = xsi_mem_cmp(t2, t3, 4U);
    if (t5 == 1)
        goto LAB5;

LAB18:    t6 = (t0 + 8630);
    t8 = xsi_mem_cmp(t6, t3, 4U);
    if (t8 == 1)
        goto LAB6;

LAB19:    t9 = (t0 + 8634);
    t11 = xsi_mem_cmp(t9, t3, 4U);
    if (t11 == 1)
        goto LAB7;

LAB20:    t12 = (t0 + 8638);
    t14 = xsi_mem_cmp(t12, t3, 4U);
    if (t14 == 1)
        goto LAB8;

LAB21:    t15 = (t0 + 8642);
    t17 = xsi_mem_cmp(t15, t3, 4U);
    if (t17 == 1)
        goto LAB9;

LAB22:    t18 = (t0 + 8646);
    t20 = xsi_mem_cmp(t18, t3, 4U);
    if (t20 == 1)
        goto LAB10;

LAB23:    t21 = (t0 + 8650);
    t23 = xsi_mem_cmp(t21, t3, 4U);
    if (t23 == 1)
        goto LAB11;

LAB24:    t24 = (t0 + 8654);
    t26 = xsi_mem_cmp(t24, t3, 4U);
    if (t26 == 1)
        goto LAB12;

LAB25:    t27 = (t0 + 8658);
    t29 = xsi_mem_cmp(t27, t3, 4U);
    if (t29 == 1)
        goto LAB13;

LAB26:    t30 = (t0 + 8662);
    t32 = xsi_mem_cmp(t30, t3, 4U);
    if (t32 == 1)
        goto LAB14;

LAB27:    t33 = (t0 + 8666);
    t35 = xsi_mem_cmp(t33, t3, 4U);
    if (t35 == 1)
        goto LAB15;

LAB28:    t36 = (t0 + 8670);
    t38 = xsi_mem_cmp(t36, t3, 4U);
    if (t38 == 1)
        goto LAB16;

LAB29:
LAB17:    xsi_set_current_line(24, ng0);
    t2 = xsi_get_transient_memory(32U);
    memset(t2, 0, 32U);
    t3 = t2;
    memset(t3, (unsigned char)2, 32U);
    t4 = (t0 + 5616);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 32U);
    xsi_driver_first_trans_fast(t4);

LAB4:    xsi_set_current_line(23, ng0);

LAB57:    t2 = (t0 + 5440);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB58;

LAB1:    return;
LAB5:    xsi_set_current_line(24, ng0);
    t40 = (t0 + 1032U);
    t41 = *((char **)t40);
    t40 = (t0 + 8388U);
    t42 = (t0 + 1192U);
    t43 = *((char **)t42);
    t42 = (t0 + 8404U);
    t44 = ieee_p_3499444699_sub_278355757_3536714472(IEEE_P_3499444699, t39, t41, t40, t43, t42);
    t45 = (t39 + 12U);
    t46 = *((unsigned int *)t45);
    t47 = (1U * t46);
    t48 = (32U != t47);
    if (t48 == 1)
        goto LAB31;

LAB32:    t49 = (t0 + 5616);
    t50 = (t49 + 56U);
    t51 = *((char **)t50);
    t52 = (t51 + 56U);
    t53 = *((char **)t52);
    memcpy(t53, t44, 32U);
    xsi_driver_first_trans_fast(t49);
    goto LAB4;

LAB6:    xsi_set_current_line(24, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 8388U);
    t4 = (t0 + 1192U);
    t6 = *((char **)t4);
    t4 = (t0 + 8404U);
    t7 = ieee_p_3499444699_sub_278427631_3536714472(IEEE_P_3499444699, t39, t3, t2, t6, t4);
    t9 = (t39 + 12U);
    t46 = *((unsigned int *)t9);
    t47 = (1U * t46);
    t48 = (32U != t47);
    if (t48 == 1)
        goto LAB33;

LAB34:    t10 = (t0 + 5616);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    t15 = (t13 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t7, 32U);
    xsi_driver_first_trans_fast(t10);
    goto LAB4;

LAB7:    xsi_set_current_line(24, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 8388U);
    t4 = (t0 + 1192U);
    t6 = *((char **)t4);
    t4 = (t0 + 8404U);
    t7 = ieee_p_2592010699_sub_795620321_503743352(IEEE_P_2592010699, t39, t3, t2, t6, t4);
    t9 = (t39 + 12U);
    t46 = *((unsigned int *)t9);
    t47 = (1U * t46);
    t48 = (32U != t47);
    if (t48 == 1)
        goto LAB35;

LAB36:    t10 = (t0 + 5616);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    t15 = (t13 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t7, 32U);
    xsi_driver_first_trans_fast(t10);
    goto LAB4;

LAB8:    xsi_set_current_line(24, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 8388U);
    t4 = (t0 + 1192U);
    t6 = *((char **)t4);
    t4 = (t0 + 8404U);
    t7 = ieee_p_2592010699_sub_1735675855_503743352(IEEE_P_2592010699, t39, t3, t2, t6, t4);
    t9 = (t39 + 12U);
    t46 = *((unsigned int *)t9);
    t47 = (1U * t46);
    t48 = (32U != t47);
    if (t48 == 1)
        goto LAB37;

LAB38:    t10 = (t0 + 5616);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    t15 = (t13 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t7, 32U);
    xsi_driver_first_trans_fast(t10);
    goto LAB4;

LAB9:    xsi_set_current_line(24, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 8388U);
    t4 = ieee_p_2592010699_sub_1837678034_503743352(IEEE_P_2592010699, t39, t3, t2);
    t6 = (t39 + 12U);
    t46 = *((unsigned int *)t6);
    t47 = (1U * t46);
    t48 = (32U != t47);
    if (t48 == 1)
        goto LAB39;

LAB40:    t7 = (t0 + 5616);
    t9 = (t7 + 56U);
    t10 = *((char **)t9);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t4, 32U);
    xsi_driver_first_trans_fast(t7);
    goto LAB4;

LAB10:    xsi_set_current_line(24, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 8388U);
    t4 = (t0 + 1192U);
    t6 = *((char **)t4);
    t4 = (t0 + 8404U);
    t7 = ieee_p_2592010699_sub_3798478767_503743352(IEEE_P_2592010699, t39, t3, t2, t6, t4);
    t9 = (t39 + 12U);
    t46 = *((unsigned int *)t9);
    t47 = (1U * t46);
    t48 = (32U != t47);
    if (t48 == 1)
        goto LAB41;

LAB42:    t10 = (t0 + 5616);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    t15 = (t13 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t7, 32U);
    xsi_driver_first_trans_fast(t10);
    goto LAB4;

LAB11:    xsi_set_current_line(24, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 8388U);
    t4 = (t0 + 1192U);
    t6 = *((char **)t4);
    t4 = (t0 + 8404U);
    t7 = ieee_p_2592010699_sub_1306069469_503743352(IEEE_P_2592010699, t39, t3, t2, t6, t4);
    t9 = (t39 + 12U);
    t46 = *((unsigned int *)t9);
    t47 = (1U * t46);
    t48 = (32U != t47);
    if (t48 == 1)
        goto LAB43;

LAB44:    t10 = (t0 + 5616);
    t12 = (t10 + 56U);
    t13 = *((char **)t12);
    t15 = (t13 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t7, 32U);
    xsi_driver_first_trans_fast(t10);
    goto LAB4;

LAB12:    xsi_set_current_line(24, ng0);
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

LAB46:    t12 = (t0 + 5616);
    t13 = (t12 + 56U);
    t15 = *((char **)t13);
    t16 = (t15 + 56U);
    t18 = *((char **)t16);
    memcpy(t18, t7, 32U);
    xsi_driver_first_trans_fast(t12);
    goto LAB4;

LAB13:    xsi_set_current_line(24, ng0);
    t2 = (t0 + 8674);
    t4 = (t0 + 1032U);
    t6 = *((char **)t4);
    t46 = (31 - 31);
    t47 = (t46 * 1U);
    t54 = (0 + t47);
    t4 = (t6 + t54);
    t9 = ((IEEE_P_2592010699) + 4024);
    t10 = (t58 + 0U);
    t12 = (t10 + 0U);
    *((int *)t12) = 0;
    t12 = (t10 + 4U);
    *((int *)t12) = 0;
    t12 = (t10 + 8U);
    *((int *)t12) = 1;
    t5 = (0 - 0);
    t55 = (t5 * 1);
    t55 = (t55 + 1);
    t12 = (t10 + 12U);
    *((unsigned int *)t12) = t55;
    t12 = (t61 + 0U);
    t13 = (t12 + 0U);
    *((int *)t13) = 31;
    t13 = (t12 + 4U);
    *((int *)t13) = 1;
    t13 = (t12 + 8U);
    *((int *)t13) = -1;
    t8 = (1 - 31);
    t55 = (t8 * -1);
    t55 = (t55 + 1);
    t13 = (t12 + 12U);
    *((unsigned int *)t13) = t55;
    t7 = xsi_base_array_concat(t7, t39, t9, (char)97, t2, t58, (char)97, t4, t61, (char)101);
    t55 = (1U + 31U);
    t48 = (32U != t55);
    if (t48 == 1)
        goto LAB47;

LAB48:    t13 = (t0 + 5616);
    t15 = (t13 + 56U);
    t16 = *((char **)t15);
    t18 = (t16 + 56U);
    t19 = *((char **)t18);
    memcpy(t19, t7, 32U);
    xsi_driver_first_trans_fast(t13);
    goto LAB4;

LAB14:    xsi_set_current_line(24, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t46 = (31 - 30);
    t47 = (t46 * 1U);
    t54 = (0 + t47);
    t2 = (t3 + t54);
    t4 = (t0 + 8675);
    t9 = ((IEEE_P_2592010699) + 4024);
    t10 = (t58 + 0U);
    t12 = (t10 + 0U);
    *((int *)t12) = 30;
    t12 = (t10 + 4U);
    *((int *)t12) = 0;
    t12 = (t10 + 8U);
    *((int *)t12) = -1;
    t5 = (0 - 30);
    t55 = (t5 * -1);
    t55 = (t55 + 1);
    t12 = (t10 + 12U);
    *((unsigned int *)t12) = t55;
    t12 = (t61 + 0U);
    t13 = (t12 + 0U);
    *((int *)t13) = 0;
    t13 = (t12 + 4U);
    *((int *)t13) = 0;
    t13 = (t12 + 8U);
    *((int *)t13) = 1;
    t8 = (0 - 0);
    t55 = (t8 * 1);
    t55 = (t55 + 1);
    t13 = (t12 + 12U);
    *((unsigned int *)t13) = t55;
    t7 = xsi_base_array_concat(t7, t39, t9, (char)97, t2, t58, (char)97, t4, t61, (char)101);
    t55 = (31U + 1U);
    t48 = (32U != t55);
    if (t48 == 1)
        goto LAB49;

LAB50:    t13 = (t0 + 5616);
    t15 = (t13 + 56U);
    t16 = *((char **)t15);
    t18 = (t16 + 56U);
    t19 = *((char **)t18);
    memcpy(t19, t7, 32U);
    xsi_driver_first_trans_fast(t13);
    goto LAB4;

LAB15:    xsi_set_current_line(24, ng0);
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

LAB52:    t12 = (t0 + 5616);
    t13 = (t12 + 56U);
    t15 = *((char **)t13);
    t16 = (t15 + 56U);
    t18 = *((char **)t16);
    memcpy(t18, t7, 32U);
    xsi_driver_first_trans_fast(t12);
    goto LAB4;

LAB16:    xsi_set_current_line(24, ng0);
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

LAB54:    t12 = (t0 + 5616);
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

LAB55:    t3 = (t0 + 5440);
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

LAB0:    xsi_set_current_line(39, ng0);
    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t1 = (t0 + 8452U);
    t3 = (t0 + 8676);
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
LAB5:    t15 = (t0 + 5680);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    *((unsigned char *)t19) = (unsigned char)2;
    xsi_driver_first_trans_fast(t15);

LAB2:    t20 = (t0 + 5456);
    *((int *)t20) = 1;

LAB1:    return;
LAB3:    t7 = (t0 + 5680);
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

LAB0:    xsi_set_current_line(40, ng0);

LAB3:    t1 = (10 * 1000LL);
    t2 = (t0 + 2472U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t2 = (t0 + 5744);
    t5 = (t2 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = t4;
    xsi_driver_first_trans_delta(t2, 0U, 1, t1);
    t9 = (t0 + 5744);
    xsi_driver_intertial_reject(t9, t1, t1);

LAB2:    t10 = (t0 + 5472);
    *((int *)t10) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0832606739_3212880686_p_3(char *t0)
{
    char t23[16];
    char t48[16];
    unsigned char t1;
    unsigned char t2;
    char *t3;
    char *t4;
    int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned char t9;
    char *t10;
    char *t11;
    int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned char t16;
    unsigned char t17;
    unsigned char t18;
    char *t19;
    char *t20;
    char *t21;
    char *t24;
    char *t25;
    int t26;
    unsigned int t27;
    unsigned char t28;
    unsigned char t29;
    char *t30;
    int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned char t34;
    char *t35;
    char *t36;
    int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned char t41;
    unsigned char t42;
    unsigned char t43;
    char *t44;
    char *t45;
    char *t46;
    char *t49;
    char *t50;
    int t51;
    unsigned int t52;
    unsigned char t53;
    char *t54;
    int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned char t58;
    char *t59;
    char *t60;
    int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned char t65;
    unsigned char t66;
    char *t67;
    char *t68;
    char *t69;
    char *t70;
    char *t71;
    char *t72;
    char *t73;
    char *t74;
    char *t75;
    char *t76;
    char *t77;

LAB0:    xsi_set_current_line(43, ng0);
    t3 = (t0 + 1032U);
    t4 = *((char **)t3);
    t5 = (31 - 31);
    t6 = (t5 * -1);
    t7 = (1U * t6);
    t8 = (0 + t7);
    t3 = (t4 + t8);
    t9 = *((unsigned char *)t3);
    t10 = (t0 + 1192U);
    t11 = *((char **)t10);
    t12 = (31 - 31);
    t13 = (t12 * -1);
    t14 = (1U * t13);
    t15 = (0 + t14);
    t10 = (t11 + t15);
    t16 = *((unsigned char *)t10);
    t17 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t9, t16);
    t18 = (t17 == (unsigned char)2);
    if (t18 == 1)
        goto LAB8;

LAB9:    t2 = (unsigned char)0;

LAB10:    if (t2 == 1)
        goto LAB5;

LAB6:    t25 = (t0 + 1032U);
    t30 = *((char **)t25);
    t31 = (31 - 31);
    t27 = (t31 * -1);
    t32 = (1U * t27);
    t33 = (0 + t32);
    t25 = (t30 + t33);
    t34 = *((unsigned char *)t25);
    t35 = (t0 + 1192U);
    t36 = *((char **)t35);
    t37 = (31 - 31);
    t38 = (t37 * -1);
    t39 = (1U * t38);
    t40 = (0 + t39);
    t35 = (t36 + t40);
    t41 = *((unsigned char *)t35);
    t42 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t34, t41);
    t43 = (t42 == (unsigned char)3);
    if (t43 == 1)
        goto LAB11;

LAB12:    t29 = (unsigned char)0;

LAB13:    t1 = t29;

LAB7:    if (t1 != 0)
        goto LAB3;

LAB4:
LAB14:    t72 = (t0 + 5808);
    t73 = (t72 + 56U);
    t74 = *((char **)t73);
    t75 = (t74 + 56U);
    t76 = *((char **)t75);
    *((unsigned char *)t76) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t72);

LAB2:    t77 = (t0 + 5488);
    *((int *)t77) = 1;

LAB1:    return;
LAB3:    t50 = (t0 + 1032U);
    t54 = *((char **)t50);
    t55 = (31 - 31);
    t52 = (t55 * -1);
    t56 = (1U * t52);
    t57 = (0 + t56);
    t50 = (t54 + t57);
    t58 = *((unsigned char *)t50);
    t59 = (t0 + 2152U);
    t60 = *((char **)t59);
    t61 = (31 - 31);
    t62 = (t61 * -1);
    t63 = (1U * t62);
    t64 = (0 + t63);
    t59 = (t60 + t64);
    t65 = *((unsigned char *)t59);
    t66 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t58, t65);
    t67 = (t0 + 5808);
    t68 = (t67 + 56U);
    t69 = *((char **)t68);
    t70 = (t69 + 56U);
    t71 = *((char **)t70);
    *((unsigned char *)t71) = t66;
    xsi_driver_first_trans_fast_port(t67);
    goto LAB2;

LAB5:    t1 = (unsigned char)1;
    goto LAB7;

LAB8:    t19 = (t0 + 1352U);
    t20 = *((char **)t19);
    t19 = (t0 + 8420U);
    t21 = (t0 + 8708);
    t24 = (t23 + 0U);
    t25 = (t24 + 0U);
    *((int *)t25) = 0;
    t25 = (t24 + 4U);
    *((int *)t25) = 3;
    t25 = (t24 + 8U);
    *((int *)t25) = 1;
    t26 = (3 - 0);
    t27 = (t26 * 1);
    t27 = (t27 + 1);
    t25 = (t24 + 12U);
    *((unsigned int *)t25) = t27;
    t28 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t20, t19, t21, t23);
    t2 = t28;
    goto LAB10;

LAB11:    t44 = (t0 + 1352U);
    t45 = *((char **)t44);
    t44 = (t0 + 8420U);
    t46 = (t0 + 8712);
    t49 = (t48 + 0U);
    t50 = (t49 + 0U);
    *((int *)t50) = 0;
    t50 = (t49 + 4U);
    *((int *)t50) = 3;
    t50 = (t49 + 8U);
    *((int *)t50) = 1;
    t51 = (3 - 0);
    t52 = (t51 * 1);
    t52 = (t52 + 1);
    t50 = (t49 + 12U);
    *((unsigned int *)t50) = t52;
    t53 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t45, t44, t46, t48);
    t29 = t53;
    goto LAB13;

LAB15:    goto LAB2;

}

static void work_a_0832606739_3212880686_p_4(char *t0)
{
    char t9[16];
    char t12[16];
    char t17[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    int t5;
    char *t6;
    char *t7;
    int t8;
    char *t10;
    char *t11;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    unsigned char t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;

LAB0:    t1 = (t0 + 4624U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(46, ng0);
    t2 = (t0 + 1352U);
    t3 = *((char **)t2);
    t2 = (t0 + 8716);
    t5 = xsi_mem_cmp(t2, t3, 4U);
    if (t5 == 1)
        goto LAB5;

LAB8:    t6 = (t0 + 8720);
    t8 = xsi_mem_cmp(t6, t3, 4U);
    if (t8 == 1)
        goto LAB6;

LAB9:
LAB7:    xsi_set_current_line(47, ng0);
    t2 = xsi_get_transient_memory(33U);
    memset(t2, 0, 33U);
    t3 = t2;
    memset(t3, (unsigned char)2, 33U);
    t4 = (t0 + 5872);
    t6 = (t4 + 56U);
    t7 = *((char **)t6);
    t10 = (t7 + 56U);
    t11 = *((char **)t10);
    memcpy(t11, t2, 33U);
    xsi_driver_first_trans_fast(t4);

LAB4:    xsi_set_current_line(46, ng0);

LAB17:    t2 = (t0 + 5504);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB18;

LAB1:    return;
LAB5:    xsi_set_current_line(47, ng0);
    t10 = (t0 + 1032U);
    t11 = *((char **)t10);
    t13 = ((IEEE_P_3499444699) + 2728);
    t14 = (t0 + 8388U);
    t10 = xsi_base_array_concat(t10, t12, t13, (char)99, (unsigned char)2, (char)97, t11, t14, (char)101);
    t15 = (t0 + 1192U);
    t16 = *((char **)t15);
    t18 = ((IEEE_P_3499444699) + 2728);
    t19 = (t0 + 8404U);
    t15 = xsi_base_array_concat(t15, t17, t18, (char)99, (unsigned char)2, (char)97, t16, t19, (char)101);
    t20 = ieee_p_3499444699_sub_278355757_3536714472(IEEE_P_3499444699, t9, t10, t12, t15, t17);
    t21 = (t9 + 12U);
    t22 = *((unsigned int *)t21);
    t23 = (1U * t22);
    t24 = (33U != t23);
    if (t24 == 1)
        goto LAB11;

LAB12:    t25 = (t0 + 5872);
    t26 = (t25 + 56U);
    t27 = *((char **)t26);
    t28 = (t27 + 56U);
    t29 = *((char **)t28);
    memcpy(t29, t20, 33U);
    xsi_driver_first_trans_fast(t25);
    goto LAB4;

LAB6:    xsi_set_current_line(47, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t4 = ((IEEE_P_3499444699) + 2728);
    t6 = (t0 + 8388U);
    t2 = xsi_base_array_concat(t2, t12, t4, (char)99, (unsigned char)2, (char)97, t3, t6, (char)101);
    t7 = (t0 + 1192U);
    t10 = *((char **)t7);
    t11 = ((IEEE_P_3499444699) + 2728);
    t13 = (t0 + 8404U);
    t7 = xsi_base_array_concat(t7, t17, t11, (char)99, (unsigned char)2, (char)97, t10, t13, (char)101);
    t14 = ieee_p_3499444699_sub_278355757_3536714472(IEEE_P_3499444699, t9, t2, t12, t7, t17);
    t15 = (t9 + 12U);
    t22 = *((unsigned int *)t15);
    t23 = (1U * t22);
    t24 = (33U != t23);
    if (t24 == 1)
        goto LAB13;

LAB14:    t16 = (t0 + 5872);
    t18 = (t16 + 56U);
    t19 = *((char **)t18);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    memcpy(t21, t14, 33U);
    xsi_driver_first_trans_fast(t16);
    goto LAB4;

LAB10:;
LAB11:    xsi_size_not_matching(33U, t23, 0);
    goto LAB12;

LAB13:    xsi_size_not_matching(33U, t23, 0);
    goto LAB14;

LAB15:    t3 = (t0 + 5504);
    *((int *)t3) = 0;
    goto LAB2;

LAB16:    goto LAB15;

LAB18:    goto LAB16;

}

static void work_a_0832606739_3212880686_p_5(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    unsigned int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned char t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;

LAB0:    xsi_set_current_line(50, ng0);

LAB3:    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t3 = (32 - 32);
    t4 = (t3 * -1);
    t5 = (1U * t4);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t7 = *((unsigned char *)t1);
    t8 = (t0 + 5936);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = t7;
    xsi_driver_first_trans_fast_port(t8);

LAB2:    t13 = (t0 + 5520);
    *((int *)t13) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0832606739_3212880686_p_6(char *t0)
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

LAB0:    xsi_set_current_line(53, ng0);

LAB3:    t1 = (10 * 1000LL);
    t2 = (t0 + 2152U);
    t3 = *((char **)t2);
    t2 = (t0 + 6000);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t3, 32U);
    xsi_driver_first_trans_delta(t2, 0U, 32U, t1);
    t8 = (t0 + 6000);
    xsi_driver_intertial_reject(t8, t1, t1);

LAB2:    t9 = (t0 + 5536);
    *((int *)t9) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_0832606739_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0832606739_3212880686_p_0,(void *)work_a_0832606739_3212880686_p_1,(void *)work_a_0832606739_3212880686_p_2,(void *)work_a_0832606739_3212880686_p_3,(void *)work_a_0832606739_3212880686_p_4,(void *)work_a_0832606739_3212880686_p_5,(void *)work_a_0832606739_3212880686_p_6};
	xsi_register_didat("work_a_0832606739_3212880686", "isim/DATAPATH3_tb_isim_beh.exe.sim/work/a_0832606739_3212880686.didat");
	xsi_register_executes(pe);
}
