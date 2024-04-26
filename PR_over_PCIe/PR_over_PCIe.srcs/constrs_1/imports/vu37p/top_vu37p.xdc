##-----------------------------------------------------------------------------
##
## (c) Copyright 2012-2012 Xilinx, Inc. All rights reserved.
##
## This file contains confidential and proprietary information
## of Xilinx, Inc. and is protected under U.S. and
## international copyright and other intellectual property
## laws.
##
## DISCLAIMER
## This disclaimer is not a license and does not grant any
## rights to the materials distributed herewith. Except as
## otherwise provided in a valid license issued to you by
## Xilinx, and to the maximum extent permitted by applicable
## law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
## WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
## AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
## BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
## INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
## (2) Xilinx shall not be liable (whether in contract or tort,
## including negligence, or under any other theory of
## liability) for any loss or damage of any kind or nature
## related to, arising under or in connection with these
## materials, including for any direct, or any indirect,
## special, incidental, or consequential loss or damage
## (including loss of data, profits, goodwill, or any type of
## loss or damage suffered as a result of any action brought
## by a third party) even if such damage or loss was
## reasonably foreseeable or Xilinx had been advised of the
## possibility of the same.
##
## CRITICAL APPLICATIONS
## Xilinx products are not designed or intended to be fail-
## safe, or for use in any application requiring fail-safe
## performance, such as life-support or safety devices or
## systems, Class III medical devices, nuclear facilities,
## applications related to the deployment of airbags, or any
## other applications that could lead to death, personal
## injury, or severe property or environmental damage
## (individually and collectively, "Critical
## Applications"). Customer assumes the sole risk and
## liability of any use of Xilinx products in Critical
## Applications, subject only to applicable laws and
## regulations governing limitations on product liability.
##
## THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
## PART OF THIS FILE AT ALL TIMES.
##
##-----------------------------------------------------------------------------
##
## Project    : The Xilinx PCI Express DMA
## File       : xilinx_pcie_xdma_ref_board.xdc
## Version    : 4.1
##-----------------------------------------------------------------------------
#
# User Configuration
# Link Width   - x8
# Link Speed   - Gen3
# Family       - virtexuplus
# Part         - xcvu9p
# Package      - flga2104
# Speed grade  - -2L
# Xilinx Reference Board is VCU118
###############################################################################
# User Time Names / User Time Groups / Time Specs
###############################################################################
##
## Free Running Clock is Required for IBERT/DRP operations.
##
# Clock for the 300 MHz clock is already created in the Clock Wizard IP.
# 300 MHz clock pin constraints.
#now 100MHz
set_property IOSTANDARD DIFF_SSTL12 [get_ports free_run_clock_p_in]
set_property IOSTANDARD DIFF_SSTL12 [get_ports free_run_clock_n_in]
set_property PACKAGE_PIN BH42 [get_ports free_run_clock_p_in]
set_property PACKAGE_PIN BJ42 [get_ports free_run_clock_n_in]
#

#############################################################################################################
##create_clock -period 10.000 -name sys_clk [get_ports sys_clk_p]
create_clock -period 10.000 -name pcie_ep_ref_clk -waveform {0.000 5.000} [get_ports sys_clk_p]


#
#############################################################################################################
set_false_path -from [get_ports sys_rst_n]
#set_property PULLUP true [get_ports sys_rst_n]
set_property IOSTANDARD LVCMOS18 [get_ports sys_rst_n]
set_property PACKAGE_PIN BF5 [get_ports sys_rst_n]
#
#set_property CONFIG_VOLTAGE 1.8 [current_design]
#set_property CFGBVS GND [current_design]


#############################################################################################################
#
##set_property PACKAGE_PIN AC8 [get_ports sys_clk_n]
##set_property PACKAGE_PIN AC9 [get_ports sys_clk_p]
set_property PACKAGE_PIN AR14 [get_ports sys_clk_n]
set_property PACKAGE_PIN AR15 [get_ports sys_clk_p]

#set_property PACKAGE_PIN BF2 [get_ports rst_pr]
#set_property IOSTANDARD LVCMOS18 [get_ports rst_pr]
#
#
#############################################################################################################


#
#
#
set_false_path -to [get_pins -hier {*sync_reg[0]/D}]
#


#set_property IOSTANDARD LVCMOS18 [get_ports reset]
#set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
#set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
#set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
#connect_debug_port dbg_hub/clk [get_nets free_run_clock]

set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_rxn[15]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_rxn[14]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_rxn[13]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_rxn[12]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_rxn[11]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_rxn[10]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_rxn[9]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_rxn[8]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_rxn[7]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_rxn[6]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_rxn[5]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_rxn[4]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_rxn[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_rxn[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_rxn[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_rxn[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_rxp[15]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_rxp[14]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_rxp[13]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_rxp[12]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_rxp[11]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_rxp[10]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_rxp[9]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_rxp[8]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_rxp[7]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_rxp[6]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_rxp[5]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_rxp[4]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_rxp[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_rxp[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_rxp[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_rxp[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_txn[15]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_txn[14]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_txn[13]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_txn[12]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_txn[11]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_txn[10]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_txn[9]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_txn[8]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_txn[7]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_txn[6]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_txn[5]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_txn[4]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_txn[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_txn[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_txn[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_txn[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_txp[15]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_txp[14]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_txp[13]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_txp[12]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_txp[11]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_txp[10]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_txp[9]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_txp[8]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_txp[7]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_txp[6]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_txp[5]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_txp[4]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_txp[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_txp[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_txp[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {pci_exp_txp[0]}]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets free_run_clock]
