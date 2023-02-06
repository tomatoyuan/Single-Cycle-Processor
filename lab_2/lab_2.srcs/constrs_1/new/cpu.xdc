set_property PACKAGE_PIN AC19 [get_ports clk]
set_property PACKAGE_PIN Y3 [get_ports reset]

set_property IOSTANDARD LVCMOS33 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports reset]

set_property PACKAGE_PIN K23 [get_ports {leds[15]}]
set_property PACKAGE_PIN J21 [get_ports {leds[14]}]
set_property PACKAGE_PIN H23 [get_ports {leds[13]}]
set_property PACKAGE_PIN J19 [get_ports {leds[12]}]
set_property PACKAGE_PIN G9 [get_ports {leds[11]}]
set_property PACKAGE_PIN J26 [get_ports {leds[10]}]
set_property PACKAGE_PIN J23 [get_ports {leds[9]}]
set_property PACKAGE_PIN J8 [get_ports {leds[8]}]
set_property PACKAGE_PIN H8 [get_ports {leds[7]}]
set_property PACKAGE_PIN G8 [get_ports {leds[6]}]
set_property PACKAGE_PIN F7 [get_ports {leds[5]}]
set_property PACKAGE_PIN A4 [get_ports {leds[4]}]
set_property PACKAGE_PIN A5 [get_ports {leds[3]}]
set_property PACKAGE_PIN A3 [get_ports {leds[2]}]
set_property PACKAGE_PIN D5 [get_ports {leds[1]}]
set_property PACKAGE_PIN H7 [get_ports {leds[0]}]

set_property IOSTANDARD LVCMOS33 [get_ports {leds[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {leds[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {leds[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {leds[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {leds[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {leds[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {leds[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {leds[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {leds[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {leds[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {leds[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {leds[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {leds[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {leds[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {leds[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {leds[0]}]







connect_debug_port u_ila_1/clk [get_nets [list U_cpu/n_0_38_BUFG]]
connect_debug_port u_ila_1/probe0 [get_nets [list {U_cpu/instr_mem/instruction[0]} {U_cpu/instr_mem/instruction[1]} {U_cpu/instr_mem/instruction[2]} {U_cpu/instr_mem/instruction[3]} {U_cpu/instr_mem/instruction[11]} {U_cpu/instr_mem/instruction[12]} {U_cpu/instr_mem/instruction[13]} {U_cpu/instr_mem/instruction[14]} {U_cpu/instr_mem/instruction[16]} {U_cpu/instr_mem/instruction[17]} {U_cpu/instr_mem/instruction[21]} {U_cpu/instr_mem/instruction[27]} {U_cpu/instr_mem/instruction[28]} {U_cpu/instr_mem/instruction[29]} {U_cpu/instr_mem/instruction[31]}]]
connect_debug_port u_ila_1/probe1 [get_nets [list {U_cpu/inst[4]} {U_cpu/inst[6]} {U_cpu/inst[7]} {U_cpu/inst[8]} {U_cpu/inst[9]} {U_cpu/inst[10]} {U_cpu/inst[15]} {U_cpu/inst[19]} {U_cpu/inst[20]} {U_cpu/inst[22]} {U_cpu/inst[23]} {U_cpu/inst[24]} {U_cpu/inst[25]} {U_cpu/inst[30]}]]
connect_debug_port dbg_hub/clk [get_nets u_ila_1_n_0_38_BUFG]




create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 2 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list clk_IBUF_BUFG]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 32 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {U_cpu/mrdata[0]} {U_cpu/mrdata[1]} {U_cpu/mrdata[2]} {U_cpu/mrdata[3]} {U_cpu/mrdata[4]} {U_cpu/mrdata[5]} {U_cpu/mrdata[6]} {U_cpu/mrdata[7]} {U_cpu/mrdata[8]} {U_cpu/mrdata[9]} {U_cpu/mrdata[10]} {U_cpu/mrdata[11]} {U_cpu/mrdata[12]} {U_cpu/mrdata[13]} {U_cpu/mrdata[14]} {U_cpu/mrdata[15]} {U_cpu/mrdata[16]} {U_cpu/mrdata[17]} {U_cpu/mrdata[18]} {U_cpu/mrdata[19]} {U_cpu/mrdata[20]} {U_cpu/mrdata[21]} {U_cpu/mrdata[22]} {U_cpu/mrdata[23]} {U_cpu/mrdata[24]} {U_cpu/mrdata[25]} {U_cpu/mrdata[26]} {U_cpu/mrdata[27]} {U_cpu/mrdata[28]} {U_cpu/mrdata[29]} {U_cpu/mrdata[30]} {U_cpu/mrdata[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 32 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {U_cpu/inst[0]} {U_cpu/inst[1]} {U_cpu/inst[2]} {U_cpu/inst[3]} {U_cpu/inst[4]} {U_cpu/inst[5]} {U_cpu/inst[6]} {U_cpu/inst[7]} {U_cpu/inst[8]} {U_cpu/inst[9]} {U_cpu/inst[10]} {U_cpu/inst[11]} {U_cpu/inst[12]} {U_cpu/inst[13]} {U_cpu/inst[14]} {U_cpu/inst[15]} {U_cpu/inst[16]} {U_cpu/inst[17]} {U_cpu/inst[18]} {U_cpu/inst[19]} {U_cpu/inst[20]} {U_cpu/inst[21]} {U_cpu/inst[22]} {U_cpu/inst[23]} {U_cpu/inst[24]} {U_cpu/inst[25]} {U_cpu/inst[26]} {U_cpu/inst[27]} {U_cpu/inst[28]} {U_cpu/inst[29]} {U_cpu/inst[30]} {U_cpu/inst[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 32 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {debug_wb_pc[0]} {debug_wb_pc[1]} {debug_wb_pc[2]} {debug_wb_pc[3]} {debug_wb_pc[4]} {debug_wb_pc[5]} {debug_wb_pc[6]} {debug_wb_pc[7]} {debug_wb_pc[8]} {debug_wb_pc[9]} {debug_wb_pc[10]} {debug_wb_pc[11]} {debug_wb_pc[12]} {debug_wb_pc[13]} {debug_wb_pc[14]} {debug_wb_pc[15]} {debug_wb_pc[16]} {debug_wb_pc[17]} {debug_wb_pc[18]} {debug_wb_pc[19]} {debug_wb_pc[20]} {debug_wb_pc[21]} {debug_wb_pc[22]} {debug_wb_pc[23]} {debug_wb_pc[24]} {debug_wb_pc[25]} {debug_wb_pc[26]} {debug_wb_pc[27]} {debug_wb_pc[28]} {debug_wb_pc[29]} {debug_wb_pc[30]} {debug_wb_pc[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 5 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {debug_wb_rf_addr[0]} {debug_wb_rf_addr[1]} {debug_wb_rf_addr[2]} {debug_wb_rf_addr[3]} {debug_wb_rf_addr[4]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 32 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {debug_wb_rf_wdata[0]} {debug_wb_rf_wdata[1]} {debug_wb_rf_wdata[2]} {debug_wb_rf_wdata[3]} {debug_wb_rf_wdata[4]} {debug_wb_rf_wdata[5]} {debug_wb_rf_wdata[6]} {debug_wb_rf_wdata[7]} {debug_wb_rf_wdata[8]} {debug_wb_rf_wdata[9]} {debug_wb_rf_wdata[10]} {debug_wb_rf_wdata[11]} {debug_wb_rf_wdata[12]} {debug_wb_rf_wdata[13]} {debug_wb_rf_wdata[14]} {debug_wb_rf_wdata[15]} {debug_wb_rf_wdata[16]} {debug_wb_rf_wdata[17]} {debug_wb_rf_wdata[18]} {debug_wb_rf_wdata[19]} {debug_wb_rf_wdata[20]} {debug_wb_rf_wdata[21]} {debug_wb_rf_wdata[22]} {debug_wb_rf_wdata[23]} {debug_wb_rf_wdata[24]} {debug_wb_rf_wdata[25]} {debug_wb_rf_wdata[26]} {debug_wb_rf_wdata[27]} {debug_wb_rf_wdata[28]} {debug_wb_rf_wdata[29]} {debug_wb_rf_wdata[30]} {debug_wb_rf_wdata[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 1 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list clk_IBUF_BUFG]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 1 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list debug_wb_rf_wen]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 1 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list p_0_in]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk_IBUF_BUFG]
