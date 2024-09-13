`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/12/2024 09:21:59 PM
// Design Name: 
// Module Name: Data_flow
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


module Data_flow(
// intilize input / output

    );
// Funtion call || Instantiation
endmodule


//TRI_STATE
module TRI_STATE(input bit mode, input logic [3:0] a, input logic s, output logic y); 

//mode = 1: active high, select line:s
//mode = 0: active_low, select line:s
//expample 
//TRI_STATE T1(.mode(1'b1), .a(4'b0000), .s(1'b1), .y(output)); active high
//TRI_STATE T1(.mode(0'b1), .a(4'b0000), .s(0'b1), .y(output)); active low

assign y = mode? (s? a : 4'bzzzz)/*active_high*/ : (~s? a : 4'bzzzz)/*active_low*/;
endmodule

//MUX
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
//2_MUX_TRISTATE
//Warning Mulitple Driver case Outputs can be z
module TWO_MUX_TRI(input logic [3:0] a, b, input logic s, output logic [3:0] y);
TRI_STATE t1(.mode(1'b0), .a(a), .s(s), .y(y)); //active low, output y(Driver 1)
TRI_STATE t2(.mode(1'b1), .a(b), .s(s), .y(y)); //active high, output y(Driver 2)

endmodule

//REDUCTION
module redu(input logic [3:0] a, output logic y);
assign y = &a; //a[3] & a[2] & a[1] & a[0] 
endmodule

//HALF_ADDER
//SUM = A ^ B
// CARRY = A&B
module half_adder(input logic a, b, output logic carry, sum);
assign carry = a&b;
assign sum = a ^ b;
endmodule

//FULL_ADDER
//SUM = A ^ B ^ C
// CARRY = (A&B) | (C&(A^B))
module full_adder(input logic a, b, c, output logic carry, sum);
assign carry = (a&b)|(c&(a^b));
assign sum = a ^ b ^ c;
endmodule

//INTERNAL VARIBALES
// y = abc + !a!bc + !(abc)b + !a
module y_func_1(input logic a, b, c, output logic y);
logic p;
assign p = a&b&c; // internal function
assign y = p|(!a & !b & c)| !p&b | !a;
endmodule

//BIT_SWIZZING
// {} -> Concatenation Operator
module condate(input logic [3:0] a,b,c , output logic [7:0] y);
assign y = {a[2:0],b[0], {4{c[0]}}};
endmodule






