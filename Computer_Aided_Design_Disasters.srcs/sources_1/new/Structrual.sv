`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/12/2024 09:21:59 PM
// Design Name: 
// Module Name: Structrual
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


//module Structrual(
//// intilize input / output

//    );
//// Funtion call || Instantiation
//endmodule


////MUX
////4:1
//module struct_4_mux(input logic[3:0] a, b, c, d, s[1:0], output logic[3:0] y);

//logic [0:3] n1,n2; // internal functions

//two_mux t1(.a(a), .b(b), .s(s[0]), .y(n1));
//two_mux t2(.a(c), .b(d), .s(s[0]), .y(n2));
//two_mux t3(.a(n1), .b(n2), .s(s[1]), .y(y));

//endmodule


////8:1
//module struct_8_mux(input logic[3:0] a, b, c, d, e, f, g, h, input logic s[2:0], output logic [3:0] y);

//logic [3:0] n1, n2;

//struct_4_mux I1(.a(a), .b(b), .c(c), .d(d), .s(s[1:0]), .y(n1));
//struct_4_mux I2(.a(e), .b(f), .c(g), .d(h), .s(s[1:0]), .y(n2));

//two_mux I3(.a(n1), .b(n2), .s(s[2]), .y(y));

//endmodule


////16:1
//// Good luck !
//module struct_16_mux(input logic[3:0] none, output logic[3:0] brain);
//assign brain = 4'bz;
//endmodule


//FULL_ADDER


//PRIMITIVE -> HALF_ADDER(data_flow_style)
//HALF_ADDER
//SUM = A ^ B
// CARRY = A&B
module half_adder(input logic a, b, output logic carry, sum);
assign carry = a&b;
assign sum = a ^ b;
endmodule

//FUll_ADDER
module FA(input logic x, y, z, output logic sum, carry);
logic n1, n2, n3; // internal varibles / nets

half_adder f1(.a(x), .b(y), .sum(n1), .carry(n2));
half_adder f2(.a(z), .b(n1), .sum(sum), .carry(n3));
or f3(carry, n2, n3);
endmodule

//4-BIT_RIPPLE_CARRY_ADDER
module RCA(input logic [3:0] a, b,input logic cin, output logic [3:0] sum, output logic carry);
logic [2:0]cry_frd;
FA fa1(.x(a[0]), .y(b[0]), .z(cin), .sum(sum[0]), .carry(cry_frd[0]));
FA fa2(.x(a[1]), .y(b[1]), .z(cry_frd[0]), .sum(sum[1]), .carry(cry_frd[1]));
FA fa3(.x(a[2]), .y(b[2]), .z(cry_frd[1]), .sum(sum[2]), .carry(cry_frd[2]));
FA fa4(.x(a[3]), .y(b[3]), .z(cry_frd[2]), .sum(sum[3]), .carry(carry));
endmodule

