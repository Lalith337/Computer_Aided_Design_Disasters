`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 09/30/2024 07:54:26 PM
// Design Name:
// Module Name: flip_flop
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


module flip_flop (
    input  logic D,
    CLK,
    reset,
    output logic Q,
    Qb
);

    always_ff @(posedge CLK) begin
        if (reset) begin
            Q  <= 1'b0;
            Qb <= 1'b1;
        end else begin
            Q  <= D;
            Qb <= ~D;
        end
    end
endmodule
