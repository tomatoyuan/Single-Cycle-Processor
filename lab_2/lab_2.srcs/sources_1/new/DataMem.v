`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/06 14:45:47
// Design Name: 
// Module Name: data_mem
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


module data_mem(
    input clk,
    input rst,
    input CS,
    input DM_W, // Write enable
    input DM_R, // Read enable
    input [31:0] addr,
    input [31:0] wdata, // SW wite data
    output [31:0] rdata // LW read data
    );
    
    reg  [31:0] ROM [255:0]; // 255 = 2^8 256*32bit, only need 8 bit to find address
    // initial begin
    //     // #2000;
    //     // $readmemh("../../../../lab2.data/data_data.txt", ROM);
    //     $readmemh("F:/my_learning/lab2/lab_2/lab2.data/data_data.txt", ROM);
    // end
    always@(posedge clk) begin
        if (!rst) begin
            $readmemh("F:/my_learning/lab2/lab_2/lab2.data/data_data.txt", ROM);
        end
    end

    /*
        requirement:  LW & SW : ([base] + offset) % 4 == 0
                addr[31:0] / 4 <==> addr[31:2]
    */
    assign rdata = (CS & DM_R) ? ROM[addr[7:2]] : 32'h0; // LW

    // always @(negedge clk) begin // SW use the negedge avoid be interrupted, make negedge useful
    always @(posedge clk) begin // SW use the negedge avoid be interrupted, make negedge useful
        if (CS) begin
            if(DM_W)
                ROM[addr[7:2]] <= wdata;
        end
    end

endmodule
