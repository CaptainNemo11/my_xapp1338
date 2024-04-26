//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2_AR75986 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
//Date        : Sat Mar  2 03:49:57 2024
//Host        : jss21 running 64-bit Ubuntu 22.04.2 LTS
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (
   input free_clk_p,
   input free_clk_n,
   input sys_clk_p,
   input sys_clk_n,
   input sys_rst_n,
   input [15:0] pcie_rxp,
   input [15:0] pcie_rxn,
   output [15:0] pcie_txp,
   output [15:0] pcie_txn  
   );
   
   wire free_clk;
   wire pr_clk;
   wire clk_100mhz_locked;
 clk_wiz clk_inst
 (
    .clk_out1(free_clk),
    .clk_out2(clk_pr),
    .reset(1'b0),
    .locked(clk_100mhz_locked),
    .clk_in1_p(free_clk_p),
    .clk_in1_n(free_clk_n));
  
  wire sys_clk_gt;
  wire sys_clk;
  wire sys_rst_n_c;
 
 IBUFDS_GTE4 #(.REFCLK_HROW_CK_SEL(2'b00)) refclk_ibuf (.O(sys_clk_gt), .ODIV2(sys_clk), .I(sys_clk_p), .CEB(1'b0), .IB(sys_clk_n));
 IBUF sys_reset_n_ibuf (.O(sys_rst_n_c), .I(sys_rst_n));
 
 wire [31:0]   M_AXIS_0_tdata;
 wire          M_AXIS_0_tvalid;
 wire          M_AXIS_0_tready;
 wire          PRDONE, PRERROR;

 

 ICAPE3  #(
 .DEVICE_ID(32'h03628093), // Specifies the pre-programmed Device ID value to be used for simulation purposes.
 .ICAP_AUTO_SWITCH("DISABLE"), // Enable switch ICAP using sync word
 .SIM_CFG_FILE_NAME("NONE") // Specifies the Raw Bitstream (RBT) file to be parsed by the simulation model
)
ICAPE3_inst (
 .AVAIL    (M_AXIS_0_tready),    // 1-bit output: Availability status of ICAP
 .O        (),         // 32-bit output: Configuration data output bus
 .PRDONE   (PRDONE),   // 1-bit output: Indicates completion of Partial Reconfiguration
 .PRERROR  (PRERROR),  // 1-bit output: Indicates Error during Partial Reconfiguration
 .CLK      (free_clk),      // 1-bit input: Clock input
 .CSIB     (!M_AXIS_0_tvalid),     // 1-bit input: Active-Low ICAP enable
 .I        (M_AXIS_0_tdata),        // 32-bit input: Configuration data input bus
 .RDWRB    (1'b0)     // 1-bit input: Read/Write Select input
);

  design_1 design_1_i
       (.M_AXIS_0_tdata(M_AXIS_0_tdata),
        .M_AXIS_0_tkeep(),
        .M_AXIS_0_tlast(),
        .M_AXIS_0_tready(M_AXIS_0_tready),
        .M_AXIS_0_tvalid(M_AXIS_0_tvalid),
        .aclk_0(free_clk),
        .aresetn_0(1'b1),
        .pcie_mgt_0_rxn(pcie_rxn),
        .pcie_mgt_0_rxp(pcie_rxp),
        .pcie_mgt_0_txn(pcie_txn),
        .pcie_mgt_0_txp(pcie_txp),
        .sys_clk_0(sys_clk),
        .sys_clk_gt_0(sys_clk_gt),
        .sys_rst_n_0(sys_rst_n_c));
        
 wire rst_pr;
 wire [3:0] count_out;
 count inst_count (
 .rst(rst_pr),
 .clk(clk_pr),
 .count_out(count_out));
 
 vio_0 vio_inst (   
 .clk(clk_pr),
 .probe_in0(count_out),
 .probe_out0(rst_pr));   
endmodule
