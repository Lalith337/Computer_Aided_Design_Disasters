`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 09/30/2024 09:03:25 PM
// Design Name:
// Module Name: tb_flip_flop
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


module tb_flip_flop();
reg D, reset;
reg CLK = 1'b0;
wire Q, Qb;

flip_flop FF1(.D(D), .CLK(CLK), .reset(reset), .Q(Q), .Qb(Qb));

initial begin
#5CLK = ~CLK;
end

initial begin
#5D = 1'b0;
#10D = 1'b1;
#20reset = 1'b1;
#5D = 1'b1;
#10D = 1'b0;
#15reset = 1'b1;
#5D = 1'b0;
#10D = 1'b1;
#15reset = 1'b0;
#5D =  1'b1;
end
endmodule
