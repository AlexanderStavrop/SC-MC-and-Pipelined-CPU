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

#include "xsi.h"

struct XSI_INFO xsi_info;

char *WORK_P_2211496920;
char *STD_STANDARD;
char *WORK_P_4059528902;
char *IEEE_P_1242562249;
char *WORK_P_0984340538;
char *IEEE_P_2592010699;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    work_p_4059528902_init();
    work_p_0984340538_init();
    ieee_p_1242562249_init();
    work_p_2211496920_init();
    work_a_2278322344_3212880686_init();
    work_a_4289239317_3212880686_init();
    work_a_1334747372_3212880686_init();
    work_a_0975640890_3212880686_init();
    work_a_0465554350_3212880686_init();
    work_a_4228852613_3212880686_init();
    work_a_0953353097_3212880686_init();
    work_a_3967920148_3212880686_init();
    work_a_3233404792_2372691052_init();


    xsi_register_tops("work_a_3233404792_2372691052");

    WORK_P_2211496920 = xsi_get_engine_memory("work_p_2211496920");
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    WORK_P_4059528902 = xsi_get_engine_memory("work_p_4059528902");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    WORK_P_0984340538 = xsi_get_engine_memory("work_p_0984340538");
    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);

    return xsi_run_simulation(argc, argv);

}
