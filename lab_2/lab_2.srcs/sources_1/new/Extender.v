`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/06 14:58:55
// Design Name: 
// Module Name: S_EXT16
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


module S_EXT16#(parameter DEPTH = 16)(
    input [DEPTH - 1:0] a,
    input sign_ext,
    output reg [31:0] b
    );

    always@(a or sign_ext) begin
        if (sign_ext == 1 && a[DEPTH - 1] == 1) begin
            b[31:0] = 32'hffffffff;
            b[DEPTH - 1:0] = a[DEPTH - 1:0];
        end
        else begin
            b[31:0] = 32'h00000000;
            b[DEPTH - 1:0] = a[DEPTH - 1:0];
        end
    end

endmodule