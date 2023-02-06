`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/06 15:05:11
// Design Name: 
// Module Name: alu
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


`define ADD     3'b000
`define SUB     3'b001
`define AND     3'b010
`define OR      3'b011
`define XOR     3'b100
`define SLT     3'b101
`define MOVZ    3'b110

module alu(
    input [31:0] a,
    input [31:0] b,
    input [2:0]  alu_op,
    output [31:0] r,
    output zero
    );

    reg [31:0] result;

    always@(*) begin
        case(alu_op)
            `ADD:
                result = a + b;
            `SUB:
                result = a - b;
            `AND:
                result = a & b;
            `OR:
                result = a | b;
            `XOR:
                result = a ^ b;
            `SLT:
                if (a < b) result = 1;
                else result = 0;
            `MOVZ:
                if (b == 0) result = a;
            default: ;
        endcase
    end

    assign r = result;
    assign zero = r ? 1'b0 : 1'b1;

endmodule