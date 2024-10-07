`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 10/04/2024 02:50:14 PM
// Design Name:
// Module Name: FPGA_01
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


module FPGA_01(input logic a, b, output logic carry, sum);
assign carry = a&b;
assign sum = a ^ b;
endmodule
