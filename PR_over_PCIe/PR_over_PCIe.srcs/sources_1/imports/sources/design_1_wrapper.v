//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.1 (lin64) Build 2188600 Wed Apr  4 18:39:19 MDT 2018
//Date        : Tue Jun  5 14:32:22 2018
//Host        : xcotechmkt41 running 64-bit Red Hat Enterprise Linux Workstation release 6.7 (Santiago)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper #
  (
  parameter PL_LINK_CAP_MAX_LINK_WIDTH          = 16,            // 1- X1; 2 - X2; 4 - X4; 8 - X8
  parameter PL_SIM_FAST_LINK_TRAINING           = "FALSE",      // Simulation Speedup
  parameter PL_LINK_CAP_MAX_LINK_SPEED          = 4,             // 1- GEN1; 2 - GEN2; 4 - GEN3
  parameter C_DATA_WIDTH                        = 512 ,
  parameter EXT_PIPE_SIM                        = "FALSE",  // This Parameter has effect on selecting Enable External PIPE Interface in GUI.
  parameter C_ROOT_PORT                         = "FALSE",      // PCIe block is in root port mode
  parameter C_DEVICE_NUMBER                     = 0,            // Device number for Root Port configurations only
  parameter AXIS_CCIX_RX_TDATA_WIDTH     = 512, 
  parameter AXIS_CCIX_TX_TDATA_WIDTH     = 512,
  parameter AXIS_CCIX_RX_TUSER_WIDTH     = 46,
  parameter AXIS_CCIX_TX_TUSER_WIDTH     = 46
  )
  (
   output [(PL_LINK_CAP_MAX_LINK_WIDTH - 1) : 0] pci_exp_txp,
   output [(PL_LINK_CAP_MAX_LINK_WIDTH - 1) : 0] pci_exp_txn,
   input [(PL_LINK_CAP_MAX_LINK_WIDTH - 1) : 0]  pci_exp_rxp,
   input [(PL_LINK_CAP_MAX_LINK_WIDTH - 1) : 0]  pci_exp_rxn,

   input                                        free_run_clock_p_in,
   input                                        free_run_clock_n_in,

 

   input            sys_clk_p,
   input            sys_clk_n,
   input            sys_rst_n
   
  
);

  //-----------------------------------------------------------------------------------------------------------------------

  
  // Local Parameters derived from user selection
  localparam integer            USER_CLK_FREQ         = ((PL_LINK_CAP_MAX_LINK_SPEED == 3'h4) ? 5 : 4);
  localparam TCQ = 1;
  localparam C_S_AXI_ID_WIDTH = 4; 
  localparam C_M_AXI_ID_WIDTH = 4; 
  localparam C_S_AXI_DATA_WIDTH = C_DATA_WIDTH;
  localparam C_M_AXI_DATA_WIDTH = C_DATA_WIDTH;
  localparam C_S_AXI_ADDR_WIDTH = 64;
  localparam C_M_AXI_ADDR_WIDTH = 64;
  localparam C_NUM_USR_IRQ   = 1;
  
 
 //----------------------------------------------------------------------------------------------------------------//
 //    System(SYS) Interface                                                                                       //
 //----------------------------------------------------------------------------------------------------------------//

   wire                                    sys_clk;
   wire                                    sys_rst_n_c;
   wire [3:0]                  leds;
   wire            led_0;
   wire            led_1;
   wire            led_2;
   wire            led_3;
   wire [3:0] shift_out;

 wire   free_run_clock;
 wire   clk_pr; 
 wire   clk_100MHz_locked;
 
 
clk_wiz_0 clk_inst
   (
    // Clock out ports
    .clk_out1(free_run_clock),      // output clk_out1 - 200MHz
    .clk_out2(clk_pr),                    // output clk_out2 - 100 MHz
    // Status and control signals
    .reset(1'b0), // input reset
    .locked(clk_100MHz_locked),       // output locked
   // Clock in ports
    .clk_in1_p(free_run_clock_p_in),      // input clk_in1_p
    .clk_in1_n(free_run_clock_n_in));    // input clk_in1_n



 // Ref clock buffer
 IBUFDS_GTE4 # (.REFCLK_HROW_CK_SEL(2'b00)) refclk_ibuf (.O(sys_clk_gt), .ODIV2(sys_clk), .I(sys_clk_p), .CEB(1'b0), .IB(sys_clk_n));
 
 // Reset buffer
 IBUF   sys_reset_n_ibuf (.O(sys_rst_n_c), .I(sys_rst_n));
 
 
 
 (* mark_debug = "true" *) wire [31:0]   M_AXIS_0_tdata;
 (* mark_debug = "true" *) wire          M_AXIS_0_tvalid;
 (* mark_debug = "true" *) wire          M_AXIS_0_tready;
 (* mark_debug = "true" *) wire          PRDONE, PRERROR;

    
design_1 design_1_i
 (.M_AXIS_0_tdata(M_AXIS_0_tdata),
        .M_AXIS_0_tkeep(),
        .M_AXIS_0_tlast(),
        .M_AXIS_0_tready(M_AXIS_0_tready),
        .M_AXIS_0_tvalid(M_AXIS_0_tvalid),
        .m_axis_aclk_0(free_run_clock),
        .m_axis_aresetn_0(1'b0),
        .pcie_mgt_0_rxn(pcie_exp_rxn),
        .pcie_mgt_0_rxp(pcie_exp_rxp),
        .pcie_mgt_0_txn(pcie_exp_txn),
        .pcie_mgt_0_txp(pcie_exp_txp),
        .sys_clk_0(sys_clk),
        .sys_clk_gt_0(sys_clk_gt),
        .sys_rst_n_0(sys_rst_n_c));       


ICAPE3 #(
 .DEVICE_ID(32'h03628093), // Specifies the pre-programmed Device ID value to be used for simulation purposes.
 .ICAP_AUTO_SWITCH("DISABLE"), // Enable switch ICAP using sync word
 .SIM_CFG_FILE_NAME("NONE") // Specifies the Raw Bitstream (RBT) file to be parsed by the simulation model
)
ICAPE3_inst (
 .AVAIL    (M_AXIS_0_tready),    // 1-bit output: Availability status of ICAP
 .O        (),         // 32-bit output: Configuration data output bus
 .PRDONE   (PRDONE),   // 1-bit output: Indicates completion of Partial Reconfiguration
 .PRERROR  (PRERROR),  // 1-bit output: Indicates Error during Partial Reconfiguration
 .CLK      (free_run_clock),      // 1-bit input: Clock input
 .CSIB     (!M_AXIS_0_tvalid),     // 1-bit input: Active-Low ICAP enable
 .I        (M_AXIS_0_tdata),        // 32-bit input: Configuration data input bus
 .RDWRB    (1'b0)     // 1-bit input: Read/Write Select input
);

ila_icap my_ila_icap (
	.clk(free_run_clock), // input wire clk
	.probe0(M_AXIS_0_tdata), // input wire [31:0]  probe0  
	.probe1({M_AXIS_0_tvalid,M_AXIS_0_tready,PRDONE, PRERROR}) // input wire [3:0]  probe1
);


  wire rst_pr;
  
   // instantiate module shift for PR
   shift inst_shift (
      .rst       (rst_pr),
      .clk      (clk_pr),
      .count_out (shift_out) 
   );
   
  // Instantiate ILA to monitor reset button and shift_out LEDs
  ila_ctrl ila_ctrl_inst (
    .clk(clk_pr),           // Clock signal for ILA
    .probe0(rst_pr),  // Probe signal for reset button
    .probe1(shift_out) // Probe signal for shift_out LEDs
  );
  
  vio_0 vio_out_inst (
  .clk(clk_pr),                // input wire clk
  .probe_in0(shift_out),    // input wire [3 : 0] probe_in0
  .probe_out0(rst_pr)  // output wire [0 : 0] probe_out0
);
endmodule
