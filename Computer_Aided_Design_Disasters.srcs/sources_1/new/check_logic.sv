`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/01/2024 03:55:54 PM
// Design Name: 
// Module Name: check_logic
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

//TRISTATE
module TRI_STATE(input logic mode, s, input logic [3:0] a, output logic [3:0] y); 

//mode = 1: active high, select line:s
//mode = 0: active_low, select line:s
//expample 
//TRI_STATE T1(.mode(1'b1), .a(4'b0000), .s(1'b1), .y(output)); active high
//TRI_STATE T1(.mode(0'b1), .a(4'b0000), .s(0'b1), .y(output)); active low
assign y = mode? (s? a : 4'bzzzz)/*active_high*/ : (~s? a : 4'bzzzz)/*active_low*/;
endmodule



//2_MUX_TRISTATE
module TWO_MUX_TRI(input logic [3:0] a, b, input logic s, output logic [3:0] y);
TRI_STATE t1(.mode(1'b0), .a(a), .s(s), .y(y)); //active low, output y(Driver 1)
TRI_STATE t2(.mode(1'b1), .a(b), .s(s), .y(y)); //active high, output y(Driver 2)

endmodule


//verify muiltple drivers
module check_logic(
        //Define I/O ports 
        input logic [3:0] a, b,
        input logic s,
        output logic [3:0] y
);
TWO_MUX_TRI M1(.a(a), .b(b), .s(s), .y(y));// check logic--multiple driver case
endmodule
