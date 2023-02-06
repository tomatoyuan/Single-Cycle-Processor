`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/06 14:58:55
// Design Name: 
// Module Name: Decoder
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

module Decoder(
    input [31:0] instruction,
    input clk,
    input zero,
    input [31:0] rs_data,
    input [31:0] rt_data,
    output IM_R,
    output RF_W,
    output M1,
    output M2,
    output M3,
    output M4,
    output M5,
    output DM_CS,
    output [2:0] ALU_OP,
    output DM_R,
    output DM_W,
    output sign_ext
    );

    wire [5:0] func = instruction[5:0];
    wire [5:0] op = instruction[31:26];
    wire [4:0] rs = instruction[25:21];
    wire [4:0] rt = instruction[20:16];
    wire R_type = ~|op; // if op == 6'b000000, is R type instruction
    // ~(op[0] | op[1] | op[2] | ... | op[31])
    wire ADD_, SUB_, AND_, OR_, XOR_, SLT_, MOVZ_; // R
    wire LW_, SW_; // I
    wire BEQ_, J_; // J

    // ADD  func: 6'b100000 op: b'000000
    assign ADD_ = R_type & func[5] & ~func[4] & ~func[3] & ~func[2] & ~func[1] & ~func[0];
    // SUB  func: 6'b100010 op: b'000000
    assign SUB_ = R_type & func[5] & ~func[4] & ~func[3] & ~func[2] & func[1] & ~func[0];
    // AND  func: 6'b100100 op: b'000000
    assign AND_ = R_type & func[5] & ~func[4] & ~func[3] & func[2] & ~func[1] & ~func[0];
    // OR   func: 6'b100101 op: b'000000
    assign OR_ = R_type & func[5] & ~func[4] & ~func[3] & func[2] & ~func[1] & func[0];
    // XOR  func: 6'b100110 op: b'000000
    assign XOR_ = R_type & func[5] & ~func[4] & ~func[3] & func[2] & func[1] & ~func[0];
    // SLT  func: 6'b101010 op: b'000000
    assign SLT_ = R_type & func[5] & ~func[4] & func[3] & ~func[2] & func[1] & ~func[0];
    // MOVZ func: 6'b001010 op: b'000000
    assign MOVZ_ = R_type & ~func[5] & ~func[4] & func[3] & ~func[2] & func[1] & ~func[0];
    // LW   op: b'100011
    assign LW_ = ~R_type & op[5] & ~op[4] & ~op[3] & ~op[2] & op[1] & op[0];
    // SW   op: b'101011
    assign SW_ = ~R_type & op[5] & ~op[4] & op[3] & ~op[2] & op[1] & op[0];
    // BEQ  op: b'000100
    assign BEQ_ = ~R_type & ~op[5] & ~op[4] & ~op[3] & op[2] & ~op[1] & ~op[0];
    // J    op: b'000010
    assign J_ = ~R_type & ~op[5] & ~op[4] & ~op[3] & ~op[2] & op[1] & ~op[0];

    assign IM_R = 1;
    
    assign RF_W = ADD_ | SUB_ | AND_ | OR_ | XOR_ | SLT_ | MOVZ_ | LW_;
    
    assign DM_CS = LW_ | SW_;
    assign DM_R = LW_;
    assign DM_W = SW_;

    assign ALU_OP[2] = XOR_ | SLT_ | MOVZ_;
    assign ALU_OP[1] = AND_ | OR_ | MOVZ_;
    assign ALU_OP[0] = SUB_ | OR_ | SLT_;

    assign M1 = ADD_ | SUB_ | AND_ | OR_ | XOR_ | SLT_ | MOVZ_ | LW_ | SW_ | BEQ_ | !(ADD_ | SUB_ | AND_ | OR_ | XOR_ | SLT_ | MOVZ_ | LW_ | SW_ | BEQ_ | J_); // only J-> M1 = 0
    assign M2 = ADD_ | SUB_ | AND_ | OR_ | XOR_ | SLT_ | MOVZ_; // only LW -> M2 = 0
    assign M3 = LW_ | SW_; // only LW & SW -> imm16 => imm32
    assign M4 = ADD_ | SUB_ | AND_ | OR_ | XOR_ | SLT_ | MOVZ_ | LW_ | SW_ | (BEQ_ && rs_data != rt_data); // only BEQ: M4 = 0
    assign M5 = LW_; // only LW write back -> M5 = 1

    assign sign_ext = LW_ | SW_ | BEQ_ | J_; // enable sign : signed extend 

endmodule
