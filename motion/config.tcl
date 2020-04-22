#loop_pipeline "loop1"
#loop_pipeline "loop2"

set_parameter LOCAL_RAMS 1
set_parameter GROUP_RAMS 0
set_parameter CASE_FSM 1
# temporary: some getelmentptr instructions have
# negative offsets which are not handled properly
# by the OR gate
set_parameter GROUP_RAMS_SIMPLE_OFFSET 0

# For MC Paths
#set_parameter MULTI_CYCLE_REMOVE_REG 1
#set_parameter MULTI_CYCLE_DISABLE_REG_MERGING 1
#set_parameter MULTI_CYCLE_DUPLICATE_LOAD_REG 1
#set_parameter MULTI_CYCLE_REMOVE_CMP_REG 1
#set_operation_latency local_mem_dual_port 2

# For MC Paths, based on SW profiling
#set_parameter LLVM_PROFILE 1
#set_parameter LLVM_PROFILE_MAX_BB_FREQ_TO_ALTER 1
#set_parameter LLVM_PROFILE_EXTRA_CYCLES 1

set_parameter ENABLE_PATTERN_SHARING 0
#set_parameter PS_MAX_SIZE 10
#set_parameter PS_MIN_SIZE 1
#set_parameter PATTERN_SHARE_ADD 1
#set_parameter PATTERN_SHARE_SUB 1
#set_parameter PATTERN_SHARE_BITOPS 1
#set_parameter PATTERN_SHARE_SHIFT 1

set_parameter SDC_NO_CHAINING 0
#set_resource_constraint divide 1
#set_resource_constraint add 1
#set_resource_constraint subtract 1
#set_resource_constraint multiply 1
#set_resource_constraint modulus 1
#set_resource_constraint bitwise 1
#set_resource_constraint shift 1
#set_resource_constraint comp 1

set_parameter CLOCK_PERIOD 1
