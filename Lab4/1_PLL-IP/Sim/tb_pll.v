`timescale 1ns/1ns
module tb_pll();

////
//\* Parameter and Internal Signal \//
////

//reg define
reg sys_clk;

 //wire define
 wire clk_mul_2 ;
 wire clk_div_2 ;
 wire clk_phase_90;
 wire clk_ducle_20;
 wire locked ;

 ////
 //\* Main Code \//
 ////

 // Init system clock
 initial sys_clk = 1'b1;

 //Simulate system clock (50 MHz)
 always #10 sys_clk = ~sys_clk;

 ////
 //\* Instantiation \//
 ////

 //------------------------pll_inst------------------------
 pll pll_inst(
 .sys_clk (sys_clk ), //input sys_clk

 .clk_mul_2 (clk_mul_2 ), //output clk_mul_2
 .clk_div_2 (clk_div_2 ), //output clk_div_2
 .clk_phase_90 (clk_phase_90 ), //output clk_phase_90
 .clk_ducle_20 (clk_ducle_20 ), //output clk_ducle_20
 .locked (locked ) //output locked
 );

 endmodule