/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
extern void execute_102(char*, char *);
extern void execute_103(char*, char *);
extern void execute_475(char*, char *);
extern void execute_476(char*, char *);
extern void execute_477(char*, char *);
extern void execute_471(char*, char *);
extern void execute_472(char*, char *);
extern void execute_473(char*, char *);
extern void execute_474(char*, char *);
extern void execute_132(char*, char *);
extern void execute_133(char*, char *);
extern void execute_134(char*, char *);
extern void execute_135(char*, char *);
extern void execute_136(char*, char *);
extern void execute_137(char*, char *);
extern void execute_138(char*, char *);
extern void execute_139(char*, char *);
extern void execute_140(char*, char *);
extern void execute_141(char*, char *);
extern void execute_142(char*, char *);
extern void execute_108(char*, char *);
extern void execute_109(char*, char *);
extern void execute_110(char*, char *);
extern void execute_111(char*, char *);
extern void execute_112(char*, char *);
extern void execute_115(char*, char *);
extern void execute_116(char*, char *);
extern void execute_117(char*, char *);
extern void execute_118(char*, char *);
extern void execute_119(char*, char *);
extern void execute_120(char*, char *);
extern void execute_121(char*, char *);
extern void execute_122(char*, char *);
extern void execute_123(char*, char *);
extern void execute_124(char*, char *);
extern void execute_125(char*, char *);
extern void execute_126(char*, char *);
extern void execute_127(char*, char *);
extern void execute_128(char*, char *);
extern void execute_129(char*, char *);
extern void execute_130(char*, char *);
extern void execute_6(char*, char *);
extern void execute_8(char*, char *);
extern void execute_10(char*, char *);
extern void execute_12(char*, char *);
extern void execute_113(char*, char *);
extern void execute_114(char*, char *);
extern void execute_18(char*, char *);
extern void execute_22(char*, char *);
extern void execute_24(char*, char *);
extern void execute_26(char*, char *);
extern void execute_32(char*, char *);
extern void execute_34(char*, char *);
extern void execute_35(char*, char *);
extern void execute_36(char*, char *);
extern void execute_131(char*, char *);
extern void execute_38(char*, char *);
extern void execute_39(char*, char *);
extern void execute_143(char*, char *);
extern void execute_144(char*, char *);
extern void execute_145(char*, char *);
extern void execute_146(char*, char *);
extern void execute_147(char*, char *);
extern void execute_148(char*, char *);
extern void vlog_const_rhs_process_execute_0_fast_no_reg_no_agg(char*, char*, char*);
extern void execute_279(char*, char *);
extern void execute_280(char*, char *);
extern void execute_289(char*, char *);
extern void execute_290(char*, char *);
extern void execute_291(char*, char *);
extern void execute_292(char*, char *);
extern void execute_293(char*, char *);
extern void execute_295(char*, char *);
extern void execute_300(char*, char *);
extern void execute_301(char*, char *);
extern void execute_302(char*, char *);
extern void execute_303(char*, char *);
extern void execute_304(char*, char *);
extern void execute_42(char*, char *);
extern void execute_70(char*, char *);
extern void vlog_simple_process_execute_0_fast_no_reg_no_agg(char*, char*, char*);
extern void execute_265(char*, char *);
extern void execute_266(char*, char *);
extern void execute_267(char*, char *);
extern void execute_268(char*, char *);
extern void execute_269(char*, char *);
extern void execute_270(char*, char *);
extern void execute_271(char*, char *);
extern void execute_51(char*, char *);
extern void execute_52(char*, char *);
extern void execute_53(char*, char *);
extern void execute_67(char*, char *);
extern void execute_68(char*, char *);
extern void execute_69(char*, char *);
extern void execute_197(char*, char *);
extern void execute_198(char*, char *);
extern void execute_199(char*, char *);
extern void execute_200(char*, char *);
extern void execute_201(char*, char *);
extern void execute_202(char*, char *);
extern void execute_203(char*, char *);
extern void execute_205(char*, char *);
extern void execute_206(char*, char *);
extern void execute_207(char*, char *);
extern void execute_208(char*, char *);
extern void execute_212(char*, char *);
extern void execute_216(char*, char *);
extern void execute_217(char*, char *);
extern void execute_218(char*, char *);
extern void execute_219(char*, char *);
extern void execute_220(char*, char *);
extern void execute_221(char*, char *);
extern void execute_224(char*, char *);
extern void execute_226(char*, char *);
extern void execute_227(char*, char *);
extern void execute_228(char*, char *);
extern void execute_229(char*, char *);
extern void execute_230(char*, char *);
extern void execute_231(char*, char *);
extern void execute_232(char*, char *);
extern void execute_233(char*, char *);
extern void execute_234(char*, char *);
extern void execute_235(char*, char *);
extern void execute_236(char*, char *);
extern void execute_237(char*, char *);
extern void execute_238(char*, char *);
extern void execute_239(char*, char *);
extern void execute_55(char*, char *);
extern void execute_56(char*, char *);
extern void execute_57(char*, char *);
extern void execute_58(char*, char *);
extern void execute_209(char*, char *);
extern void execute_210(char*, char *);
extern void execute_211(char*, char *);
extern void execute_60(char*, char *);
extern void execute_61(char*, char *);
extern void execute_62(char*, char *);
extern void execute_63(char*, char *);
extern void execute_213(char*, char *);
extern void execute_214(char*, char *);
extern void execute_215(char*, char *);
extern void execute_65(char*, char *);
extern void execute_66(char*, char *);
extern void execute_435(char*, char *);
extern void execute_441(char*, char *);
extern void execute_442(char*, char *);
extern void execute_451(char*, char *);
extern void execute_452(char*, char *);
extern void execute_453(char*, char *);
extern void execute_454(char*, char *);
extern void execute_455(char*, char *);
extern void execute_457(char*, char *);
extern void execute_462(char*, char *);
extern void execute_463(char*, char *);
extern void execute_464(char*, char *);
extern void execute_465(char*, char *);
extern void execute_466(char*, char *);
extern void execute_73(char*, char *);
extern void execute_101(char*, char *);
extern void execute_425(char*, char *);
extern void execute_426(char*, char *);
extern void execute_427(char*, char *);
extern void execute_428(char*, char *);
extern void execute_429(char*, char *);
extern void execute_430(char*, char *);
extern void execute_431(char*, char *);
extern void execute_82(char*, char *);
extern void execute_83(char*, char *);
extern void execute_84(char*, char *);
extern void execute_98(char*, char *);
extern void execute_99(char*, char *);
extern void execute_100(char*, char *);
extern void execute_357(char*, char *);
extern void execute_358(char*, char *);
extern void execute_359(char*, char *);
extern void execute_360(char*, char *);
extern void execute_361(char*, char *);
extern void execute_362(char*, char *);
extern void execute_363(char*, char *);
extern void execute_365(char*, char *);
extern void execute_366(char*, char *);
extern void execute_367(char*, char *);
extern void execute_368(char*, char *);
extern void execute_372(char*, char *);
extern void execute_376(char*, char *);
extern void execute_377(char*, char *);
extern void execute_378(char*, char *);
extern void execute_379(char*, char *);
extern void execute_380(char*, char *);
extern void execute_381(char*, char *);
extern void execute_384(char*, char *);
extern void execute_386(char*, char *);
extern void execute_387(char*, char *);
extern void execute_388(char*, char *);
extern void execute_389(char*, char *);
extern void execute_390(char*, char *);
extern void execute_391(char*, char *);
extern void execute_392(char*, char *);
extern void execute_393(char*, char *);
extern void execute_394(char*, char *);
extern void execute_395(char*, char *);
extern void execute_396(char*, char *);
extern void execute_397(char*, char *);
extern void execute_398(char*, char *);
extern void execute_399(char*, char *);
extern void execute_105(char*, char *);
extern void execute_106(char*, char *);
extern void execute_107(char*, char *);
extern void execute_478(char*, char *);
extern void execute_479(char*, char *);
extern void execute_480(char*, char *);
extern void execute_481(char*, char *);
extern void execute_482(char*, char *);
extern void vlog_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
funcp funcTab[214] = {(funcp)execute_102, (funcp)execute_103, (funcp)execute_475, (funcp)execute_476, (funcp)execute_477, (funcp)execute_471, (funcp)execute_472, (funcp)execute_473, (funcp)execute_474, (funcp)execute_132, (funcp)execute_133, (funcp)execute_134, (funcp)execute_135, (funcp)execute_136, (funcp)execute_137, (funcp)execute_138, (funcp)execute_139, (funcp)execute_140, (funcp)execute_141, (funcp)execute_142, (funcp)execute_108, (funcp)execute_109, (funcp)execute_110, (funcp)execute_111, (funcp)execute_112, (funcp)execute_115, (funcp)execute_116, (funcp)execute_117, (funcp)execute_118, (funcp)execute_119, (funcp)execute_120, (funcp)execute_121, (funcp)execute_122, (funcp)execute_123, (funcp)execute_124, (funcp)execute_125, (funcp)execute_126, (funcp)execute_127, (funcp)execute_128, (funcp)execute_129, (funcp)execute_130, (funcp)execute_6, (funcp)execute_8, (funcp)execute_10, (funcp)execute_12, (funcp)execute_113, (funcp)execute_114, (funcp)execute_18, (funcp)execute_22, (funcp)execute_24, (funcp)execute_26, (funcp)execute_32, (funcp)execute_34, (funcp)execute_35, (funcp)execute_36, (funcp)execute_131, (funcp)execute_38, (funcp)execute_39, (funcp)execute_143, (funcp)execute_144, (funcp)execute_145, (funcp)execute_146, (funcp)execute_147, (funcp)execute_148, (funcp)vlog_const_rhs_process_execute_0_fast_no_reg_no_agg, (funcp)execute_279, (funcp)execute_280, (funcp)execute_289, (funcp)execute_290, (funcp)execute_291, (funcp)execute_292, (funcp)execute_293, (funcp)execute_295, (funcp)execute_300, (funcp)execute_301, (funcp)execute_302, (funcp)execute_303, (funcp)execute_304, (funcp)execute_42, (funcp)execute_70, (funcp)vlog_simple_process_execute_0_fast_no_reg_no_agg, (funcp)execute_265, (funcp)execute_266, (funcp)execute_267, (funcp)execute_268, (funcp)execute_269, (funcp)execute_270, (funcp)execute_271, (funcp)execute_51, (funcp)execute_52, (funcp)execute_53, (funcp)execute_67, (funcp)execute_68, (funcp)execute_69, (funcp)execute_197, (funcp)execute_198, (funcp)execute_199, (funcp)execute_200, (funcp)execute_201, (funcp)execute_202, (funcp)execute_203, (funcp)execute_205, (funcp)execute_206, (funcp)execute_207, (funcp)execute_208, (funcp)execute_212, (funcp)execute_216, (funcp)execute_217, (funcp)execute_218, (funcp)execute_219, (funcp)execute_220, (funcp)execute_221, (funcp)execute_224, (funcp)execute_226, (funcp)execute_227, (funcp)execute_228, (funcp)execute_229, (funcp)execute_230, (funcp)execute_231, (funcp)execute_232, (funcp)execute_233, (funcp)execute_234, (funcp)execute_235, (funcp)execute_236, (funcp)execute_237, (funcp)execute_238, (funcp)execute_239, (funcp)execute_55, (funcp)execute_56, (funcp)execute_57, (funcp)execute_58, (funcp)execute_209, (funcp)execute_210, (funcp)execute_211, (funcp)execute_60, (funcp)execute_61, (funcp)execute_62, (funcp)execute_63, (funcp)execute_213, (funcp)execute_214, (funcp)execute_215, (funcp)execute_65, (funcp)execute_66, (funcp)execute_435, (funcp)execute_441, (funcp)execute_442, (funcp)execute_451, (funcp)execute_452, (funcp)execute_453, (funcp)execute_454, (funcp)execute_455, (funcp)execute_457, (funcp)execute_462, (funcp)execute_463, (funcp)execute_464, (funcp)execute_465, (funcp)execute_466, (funcp)execute_73, (funcp)execute_101, (funcp)execute_425, (funcp)execute_426, (funcp)execute_427, (funcp)execute_428, (funcp)execute_429, (funcp)execute_430, (funcp)execute_431, (funcp)execute_82, (funcp)execute_83, (funcp)execute_84, (funcp)execute_98, (funcp)execute_99, (funcp)execute_100, (funcp)execute_357, (funcp)execute_358, (funcp)execute_359, (funcp)execute_360, (funcp)execute_361, (funcp)execute_362, (funcp)execute_363, (funcp)execute_365, (funcp)execute_366, (funcp)execute_367, (funcp)execute_368, (funcp)execute_372, (funcp)execute_376, (funcp)execute_377, (funcp)execute_378, (funcp)execute_379, (funcp)execute_380, (funcp)execute_381, (funcp)execute_384, (funcp)execute_386, (funcp)execute_387, (funcp)execute_388, (funcp)execute_389, (funcp)execute_390, (funcp)execute_391, (funcp)execute_392, (funcp)execute_393, (funcp)execute_394, (funcp)execute_395, (funcp)execute_396, (funcp)execute_397, (funcp)execute_398, (funcp)execute_399, (funcp)execute_105, (funcp)execute_106, (funcp)execute_107, (funcp)execute_478, (funcp)execute_479, (funcp)execute_480, (funcp)execute_481, (funcp)execute_482, (funcp)vlog_transfunc_eventcallback};
const int NumRelocateId= 214;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/computer_t_behav/xsim.reloc",  (void **)funcTab, 214);

	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/computer_t_behav/xsim.reloc");
}

void simulate(char *dp)
{
	iki_schedule_processes_at_time_zero(dp, "xsim.dir/computer_t_behav/xsim.reloc");
	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net
	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern void implicit_HDL_SCinstatiate();

extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/computer_t_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/computer_t_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/computer_t_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
