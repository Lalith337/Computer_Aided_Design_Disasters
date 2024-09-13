`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/12/2024 09:21:59 PM
// Design Name: 
// Module Name: Behavioural
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


module Behavioural(
// initialize Input/Output
    );
// Function call
endmodule

//AND
module AND_behav(input logic a, b, output logic y);
always_comb begin
y = a&b;
end
endmodule

//4-bit register
module four_b_reg(input logic [3:0] D, input logic CLK, output logic [3:0] Q);
always_ff@(posedge CLK)
Q <= D;
endmodule

//4-bit register with reset
//async
module four_b_reg_ar(input logic [3:0] D, input logic CLK, R, output logic [3:0] Q);
always_ff@(posedge CLK, posedge R) begin
if(R) Q <= 4'b0;
else Q <= D;
end
endmodule

//sync
module four_b_reg_sr(input logic [3:0] D, input CLK , R, output logic [3:0] Q);
always@(posedge CLK) begin
if(R) Q <= 4'b0;
else Q <= D;
end
endmodule

//4-bit register with reset enable
module four_b_reg_sre(input logic [3:0] D, input logic CLK, EN, R, output logic [3:0] Q);
always_ff@(posedge CLK) begin
if(R) Q <= 4'b0;
else if (EN) Q <= D;
end
endmodule

//multiple 4-bit register Serial in Serial out(SISO)
module mutliple_reg(input logic [3:0] D, input logic CLK, output logic [3:0] Q);
logic [3:0] N1;
always_ff@(posedge CLK) begin
N1 <= D;
Q <= N1;
end
endmodule

//multiple 4-bit register Parallel in Parallel out(PIPO)
module mutliple_reg_1(input logic [3:0] D0, D1, input logic CLK, output logic [3:0] Q0, Q1);
always_ff@(posedge CLK) begin
Q0 <= D0;
Q1 <= D1;
end
endmodule

