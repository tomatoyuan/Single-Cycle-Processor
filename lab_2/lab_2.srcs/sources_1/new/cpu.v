`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/06 14:01:58
// Design Name: 
// Module Name: cpu
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


module cpu(
    input clk,
    input reset,

    // debug signals
    output [31:0]   debug_wb_pc         ,   // current PC
    output          debug_wb_rf_wen     ,   // Regfile write enable signal
    output [4 :0]   debug_wb_rf_addr    ,   // address of regfile writing
    output [31:0]   debug_wb_rf_wdata       // data of regfile writing
    );
    
    (*mark_debug = "true"*) wire [31:0] inst;
    wire IM_R;
    wire [31:0] rdata;
    wire [31:0] wdata;
    wire DM_CS;
    wire DM_R;
    wire DM_W;
    (*mark_debug = "true"*) wire [31:0] mrdata;
    wire [31:0] mwdata;
    wire [31:0] maddr;
    
    wire RF_W, M1, M2, M3, M4, M5, sign_ext, zero;
    wire [2:0] ALU_OP;
    wire [31:0] mux1_out, mux2_out, mux3_out, mux4_out, alu_out;
    wire [31:0] rf_rdata1, rf_rdata2; // regfile
    wire [31:0] s_ext16_out, s_ext18_out, s_ext28_out;
    wire [31:0] npc_out;
    wire [31:0] cat_str_out;
    wire [27:0] temp1;
    wire [17:0] temp2;
    wire [4:0] rs, rt;
    wire [31:0] alu_r;

    assign rs = inst[25:21]; // rs
    assign rt = inst[20:16]; // rt

    assign alu_r = alu_out;
    assign maddr = alu_out;
    assign mwdata = rf_rdata2;
    assign temp1 = inst[25:0] << 2; // J
    assign temp2 = inst[15:0] << 2; // BEQ


    instr_mem instr_mem(.clk(clk), .addr(debug_wb_pc), .IM_R(IM_R), .rst(reset), .instruction(inst));

    Decoder cup_decoder(.instruction(inst), .clk(clk), .zero(zero),
                        .rs_data(rf_rdata1), .rt_data(rf_rdata2), .IM_R(IM_R), 
                        .RF_W(RF_W), .M1(M1), .M2(M2), .M3(M3), .M4(M4), .M5(M5), 
                        .DM_CS(DM_CS), .ALU_OP(ALU_OP), .DM_R(DM_R), .DM_W(DM_W), .sign_ext(sign_ext)
                        );
    
    PC cpu_pc(.clk(clk), .rst(reset), .data_in(mux1_out), .data_out(debug_wb_pc));
    NPC cpu_npc(.pc(debug_wb_pc), .npc(npc_out));

    Strcat cpu_strcat(.addr28(temp1), .npc_high4(debug_wb_pc[31:28]), .jump2addr(cat_str_out)); // get J's goal addr
    
    assign debug_wb_rf_addr = M5 ? rt : inst[15:11];
    assign debug_wb_rf_wdata = mux2_out;
    assign debug_wb_rf_wen = RF_W;
    regfile cpu_regfile(.clk(clk), .rst(reset), .rf_w(RF_W), .raddr1(inst[25:21]), .raddr2(inst[20:16]),
     .waddr(debug_wb_rf_addr), .wdata(mux2_out), .rdata1(rf_rdata1), .rdata2(rf_rdata2));
    
    alu cpu_alu(.a(rf_rdata1), .b(mux3_out), .alu_op(ALU_OP), .r(alu_out), .zero(zero));

    S_EXT16 cpu_s_ext16(.a(inst[15:0]), .sign_ext(sign_ext), .b(s_ext16_out)); // LW, SW

    mux mux1(.a(cat_str_out), .b(mux4_out), .select(M1), .r(mux1_out));
    mux mux2(.a(mrdata), .b(alu_out), .select(M2), .r(mux2_out));
    mux mux3(.a(rf_rdata2), .b(s_ext16_out), .select(M3), .r(mux3_out));
    mux mux4(.a((s_ext16_out<<2)+npc_out), .b(npc_out), .select(M4), .r(mux4_out));
    // mux #(.WIDTH(5)) mux5(.a(inst[15:11]), .b(rt), .select(M5), .r(mux5_out));

    data_mem scDmem(.clk(clk), .rst(reset), .CS(DM_CS), .DM_W(DM_W), .DM_R(DM_R), 
                .addr(maddr), .wdata(mwdata), .rdata(mrdata));
                
endmodule