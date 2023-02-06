`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/06 14:39:31
// Design Name: 
// Module Name: instr_mem
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


module instr_mem(
    input clk,
    input [31:0] addr,
    input IM_R,
    input rst,
    output [31:0]instruction
    );

    reg [31:0] RAM [255:0]; // 256 * 32bit, only need 8bits to find address
    
    always@(posedge clk) begin // There is a little error, program starts half of a cycle before posedge rst, but it's ok for test.
        if (!rst) begin
            $readmemh("F:/my_learning/lab2/lab_2/lab2.data/inst_data.txt", RAM);
        end
    end

    assign instruction = (IM_R) ? RAM[addr[7:2]] : 32'bx; // get instruction

endmodule

