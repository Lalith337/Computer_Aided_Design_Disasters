`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/31/2024 09:43:13 AM
// Design Name: 
// Module Name: TIR_STATE
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


module TRI_STATE(input bit mode, input logic [3:0] a, input logic s, output logic y); 

//mode = 1: active high, select line:s
//mode = 0: active_low, select line:s
//expample 
//TRI_STATE T1(.mode(1'b1), .a(4'b0000), .s(1'b1), .y(output)); active high
//TRI_STATE T1(.mode(0'b1), .a(4'b0000), .s(0'b1), .y(output)); active low

assign y = mode? (s? a : 4'bzzzz)/*active_high*/ : (~s? a : 4'bzzzz)/*active_low*/;
endmodule


