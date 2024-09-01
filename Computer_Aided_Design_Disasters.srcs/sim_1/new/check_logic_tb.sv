`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/01/2024 04:14:22 PM
// Design Name: 
// Module Name: check_logic_tb
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


module check_logic_tb();
reg [3:0] a, b;
reg s;
wire [3:0]y;

check_logic tb(.a(a), .b(b), .s(s), .y(y));
initial begin
    a = 4'b0000; b = 4'b1111; s = 1'b0;#1
    $display("%d %d %d %d", a, b, s, y);#10
    a = 4'b0011; b = 4'b1100; s = 1'b0;#1
    $display("%d %d %d %d", a, b, s, y);#10
    $stop;
    end
endmodule
