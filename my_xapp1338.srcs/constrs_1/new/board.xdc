set_property IOSTANDARD DIFF_SSTL12 [get_ports free_clk_p]
set_property IOSTANDARD DIFF_SSTL12 [get_ports free_clk_n]
set_property PACKAGE_PIN BH42 [get_ports free_clk_p]
set_property PACKAGE_PIN BJ42 [get_ports free_clk_n]

create_clock -period 10.000 -name pcie_ep_ref_clk -waveform {0.000 5.000} [get_ports sys_clk_p]



set_false_path -from [get_ports sys_rst_n]
set_property IOSTANDARD LVCMOS18 [get_ports sys_rst_n]
set_property PACKAGE_PIN BF5 [get_ports sys_rst_n]

set_property PACKAGE_PIN AR14 [get_ports sys_clk_n]
set_property PACKAGE_PIN AR15 [get_ports sys_clk_p]

#
#
set_false_path -to [get_pins -hier {*sync_reg[0]/D}]
#

