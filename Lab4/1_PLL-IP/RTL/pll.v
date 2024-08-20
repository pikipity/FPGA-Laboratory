module pll
(
input wire sys_clk , //System clock: 50MHz

output wire clk_mul_2 , //c0
output wire clk_div_2 , //c1
output wire clk_phase_90 , //c2
output wire clk_ducle_20 , //c3
output wire locked //Check whether the phase-locked loop is locked.
 );

 ////
 //\* Instantiation \//
 ////

 //------------------------pll_ip_inst------------------------
 pll_ip pll_ip_inst
 (
 .inclk0 (sys_clk ), //input inclk0

 .c0 (clk_mul_2 ), //output c0
 .c1 (clk_div_2 ), //output c1
 .c2 (clk_phase_90 ), //output c2
 .c3 (clk_ducle_20 ), //output c3
 .locked (locked ) //output locked
 );

 endmodule