`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/06 14:58:55
// Design Name: 
// Module Name: Regfile
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


module regfile(
    input clk,
    input rst,
    input rf_w,
    input [4:0] raddr1, // rsc
    input [4:0] raddr2, // rtc
    input [4:0] waddr,  // rdc
    input [31:0] wdata, // rd
    output [31:0] rdata1, // rs
    output [31:0] rdata2 // rt
    );
    reg [31:0] array_reg[31:0];
//    (*mark_debug = "true"*) reg [31:0] array_reg[31:0];
    integer i;

    always@(negedge clk) begin
        if (!rst) begin
            i = 0;
            while (i < 32) begin
                array_reg[i] = 0;
                i = i + 1;
            end
        end
        if (rf_w) begin
            if (waddr != 0)
                array_reg[waddr] = wdata;
        end     
    end

    assign rdata1 = array_reg[raddr1];
    assign rdata2 = array_reg[raddr2];

endmodule
