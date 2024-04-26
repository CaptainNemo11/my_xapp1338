create_pblock pblock_inst_count
add_cells_to_pblock [get_pblocks pblock_inst_count] [get_cells -quiet [list inst_count]]
resize_pblock [get_pblocks pblock_inst_count] -add {SLICE_X4Y144:SLICE_X25Y230}
resize_pblock [get_pblocks pblock_inst_count] -add {DSP48E2_X1Y52:DSP48E2_X1Y85}
resize_pblock [get_pblocks pblock_inst_count] -add {RAMB18_X0Y58:RAMB18_X1Y91}
resize_pblock [get_pblocks pblock_inst_count] -add {RAMB36_X0Y29:RAMB36_X1Y45}
set_property SNAPPING_MODE ON [get_pblocks pblock_inst_count]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk_pr]
