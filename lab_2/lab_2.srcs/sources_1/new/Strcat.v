`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/06 14:58:55
// Design Name: 
// Module Name: CatStr
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


module Strcat(
    input [27:0] addr28,
    input [3:0] npc_high4,
    output [31:0] jump2addr
    );

    assign jump2addr[31:28] = npc_high4;
    assign jump2addr[27:0] = addr28;
    
endmodule
