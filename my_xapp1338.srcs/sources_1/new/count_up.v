`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2024 07:12:59 AM
// Design Name: 
// Module Name: count_up
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module count (
   rst,
   clk,
   count_out
);

   input rst;                // Active high reset
   input clk;                // 200MHz input clock
   output [3:0] count_out;   // Output to LEDs

   reg [24:0] count;
   reg [3:0]  count_out;
   reg [3:0]  count_en = 4'b0101;  // Special init register to test REST_AFTER_RECONFIG(aka GSR)

   //Counter to reduce speed of output
   always @(posedge clk)
      if (rst) begin
         count <= 0;
      end
      else begin
         count <= count + 1;
      end

    always @(posedge clk)
      if (rst)
         count_out <= 4'b0000;
      else begin
         if (count == 25'b1111111111111111111111111 && count_en == 4'b0101) begin
            count_out <= count_out + 1;
         end
      end
endmodule
