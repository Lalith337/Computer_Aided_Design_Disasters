`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2024 06:31:09 PM
// Design Name: 
// Module Name: dummies_test_cases
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


module dummies_test_cases();
endmodule

//test bench for dfrl
module dfrl_tb();
reg clk = 1'b0;
  reg reset, load, d;
  wire q;

  dfrl FA1(.clk(clk), .reset(reset), .load(load), .d(d), .q(q));

  always #5 clk = ~clk;

  initial begin 
    reset = 1; #10;
    reset = 0; #10;
    load = 1;
    d = 1; #10;
    load = 0; #10;
    d = 0; #10;
    reset = 1; #10;
    reset = 0; #10;
    load = 1;
    d = 0; #10;
  end
endmodule