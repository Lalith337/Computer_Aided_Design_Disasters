`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 10/07/2024 06:18:00 PM
// Design Name:
// Module Name: verilog_for_dummies
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


//module verilog_for_dummies ();
//endmodule

//mux128_16
module mux128_16 (
  input wire [15:0] in0, 
  input wire [15:0] in1, 
  input wire [15:0] in2, 
  input wire [15:0] in3, 
  input wire [15:0] in4, 
  input wire [15:0] in5, 
  input wire [15:0] in6, 
  input wire [15:0] in7, 
  input wire [2:0] s, 
  output reg [15:0] out
);

  always @(*) begin
    case (s)
      3'b000: out = in0;
      3'b001: out = in1;
      3'b010: out = in2;
      3'b011: out = in3;
      3'b100: out = in4;
      3'b101: out = in5;
      3'b110: out = in6;
      3'b111: out = in7;
      default: out = 16'b0;
    endcase
  end

endmodule

//demux
module demux8 (
  input wire wr, 
  input wire [2:0] s, 
  output reg [7:0] load
);
  always @(*) begin
    load = 8'b0;
    if (wr) begin
      load[s] = 1;
    end
  end
endmodule


// d-flipflop with reset and load
module dfrl (
    input  wire clk,
    load,
    reset,
    input  wire d,
    output reg  q
);
    always @(posedge clk, reset) begin
        if (reset) q <= 1'b0;  // Reset output to 0
        else if (load) q <= d;  // Load data 'd' into 'q'
    end
endmodule


//reg16 *shitty_name
//use the looop lol and some *brain also
module reg16(input wire clk, reset, load, input wire [15:0] d, output wire [15:0] q);
  genvar j; //looping variable to over see looping same as int i; (in C)
  
  generate // generate block is used for conditional or iterative hardware generation at compile time
    
    for (j = 0; j < 16; j = j + 1) 
    begin : dfrl_lol // (dfrl_lol)verilog requries a block name *takes care of the scope 
      dfrl d_inst (.clk(clk), .reset(reset), .load(load), .d(d[i]), .q(q[i]));
    end
  
  endgenerate // generate needs a end.

endmodule


//reg_file
module reg_file (
  input wire clk, 
  input wire reset, 
  input wire wr, 
  input wire [2:0] rd_addr_a, 
  input wire [2:0] rd_addr_b, 
  input wire [2:0] wr_addr, 
  input wire [15:0] d_in, 
  output wire [15:0] d_out_a, 
  output wire [15:0] d_out_b
);

  wire [7:0] load;
  wire [15:0] r [0:7];

  demux8 dmx (.wr(wr), .s(wr_addr), .load(load));

  genvar i;
  generate
    for (i = 0; i < 8; i = i + 1) begin : reg_loop
      reg16 reg_inst (
        .clk(clk),
        .reset(reset),
        .load(load[i]),
        .din(d_in),
        .r(r[i])
      );
    end
  endgenerate

  mux128_16 mm0 (.in0(r[0]), .in1(r[1]), .in2(r[2]), .in3(r[3]), .in4(r[4]), .in5(r[5]), .in6(r[6]), .in7(r[7]), 
                 .s(rd_addr_a), .out(d_out_a));

  mux128_16 mm1 (.in0(r[0]), .in1(r[1]), .in2(r[2]), .in3(r[3]), .in4(r[4]), .in5(r[5]), .in6(r[6]), .in7(r[7]), 
                 .s(rd_addr_b), .out(d_out_b));

endmodule


