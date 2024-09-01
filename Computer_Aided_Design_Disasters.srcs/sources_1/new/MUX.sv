`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/30/2024 10:54:31 PM
// Design Name: 
// Module Name: MUX
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


module MUX();
endmodule


// Data_ flow
//2:1
module two_mux(input logic [3:0] a, b, input logic s, output logic [3:0] y);
assign y = s?b:a;
endmodule


//4:1
module four_mux(input logic [3:0] a, b, c, d, input logic s[1:0], output logic [3:0] y);

assign y = s[0]? (s[1]? d : c) : (s[1]? b : a);

endmodule


//8:1
module eight_mux(input logic [3:0] a, b, c, d, e, f, g, h, input logic s[2:0], output logic [3:0] y);

logic [3:0] m1, m2;

four_mux M1(.a(a), .b(b), .c(c), .d(d), .s(s[1:0]), .y(m1)); //4:1 MUX(a, b, c, d) with select s[1;0, m1 output
four_mux M2(.a(e), .b(f), .c(g), .d(h), .s(s[1:0]), .y(m2)); //4:1 MUX(e, f, g, h) with select s[1;0, m2 output

assign y = s[2]?m2:m1; // 2:1 MUX(m1,m2) with slect s[2] output y

endmodule


//16:1
//Nah bruh do it yourself !

//MUX_ with _TRI_state;
//TRI_STATE
module TRI_STATE(input bit mode, input logic [3:0] a, input logic s, output logic y); 

//mode = 1: active high, select line:s
//mode = 0: active_low, select line:s
//expample 
//TRI_STATE T1(.mode(1'b1), .a(4'b0000), .s(1'b1), .y(output)); active high
//TRI_STATE T1(.mode(0'b1), .a(4'b0000), .s(0'b1), .y(output)); active low

assign y = mode? (s? a : 4'bzzzz)/*active_high*/ : (~s? a : 4'bzzzz)/*active_low*/;
endmodule

//2:1
module TWO_MUX_TRI(input logic [3:0] a, b,input logic s, output logic [3:0] y);

assign y = s ? b : 4'bz;
assign y = !s ? a : 4'bz;

endmodule


//Structrual Modeling

//4:1
module struct_4_mux(input logic[3:0] a, b, c, d, s[1:0], output logic[3:0] y);

logic [0:3] n1,n2; // internal functions

two_mux t1(.a(a), .b(b), .s(s[0]), .y(n1));
two_mux t2(.a(c), .b(d), .s(s[0]), .y(n2));
two_mux t3(.a(n1), .b(n2), .s(s[1]), .y(y));

endmodule


//8:1
module struct_8_mux(input logic[3:0] a, b, c, d, e, f, g, h, input logic s[2:0], output logic [3:0] y);

logic [3:0] n1, n2;

struct_4_mux I1(.a(a), .b(b), .c(c), .d(d), .s(s[1:0]), .y(n1));
struct_4_mux I2(.a(e), .b(f), .c(g), .d(h), .s(s[1:0]), .y(n2));

two_mux I3(.a(n1), .b(n2), .s(s[2]), .y(y));

endmodule


//16:1
// Good luck !
module struct_16_mux(input logic[3:0] none, output logic[3:0] brain);
assign brain = 4'bz;
endmodule

