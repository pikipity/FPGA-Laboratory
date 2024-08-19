`timescale 1ns/1ns
module tb_syn_flip_flop();

//reg define
reg sys_clk ;
reg sys_rst_n ;
reg key_in ;

//wire deifne
 wire led_out ;

 //Init inputs
 initial begin
 sys_clk = 1'b1; //Clock uses blocking assignment.
 
 // Other inputs use un-block assignments
 sys_rst_n <= 1'b0; //At the beginning, the reset button is pressed.
 key_in <= 1'b0; //The input is initialed as 0
 
 #20
 sys_rst_n <= 1'b1; //After 20ns, the reset button is released
 
 
 #210
 sys_rst_n <= 1'b0; 
 /*
 In order to observe the difference between synchronous reset and asynchronous reset, 
 the reset button is pressed again after working 210ns.
 The reason for choosing a delay of 210ns instead of 200ns or 220ns is that 
 it can make the reset signal reset at the falling edge of the clock, 
 and the difference between synchronous reset and asynchronous reset can be clearly seen.
 */
 
 #40
 sys_rst_n <= 1'b1; //After 40ns, the reset button is released again
 end

 /*
 Simulate system clock 50M Hz. The period is 20ns. The half period is 10ns, 
 which means the clock signal is inversed every 10ns.
 */
 always #10 sys_clk = ~sys_clk; 

 
 always #20 key_in <= {$random} % 2;

 //------------------------------------------------------------
 initial begin
 $timeformat(-9, 0, "ns", 6);
 $monitor("@time %t: key_in=%b led_out=%b", $time, key_in, led_out);
 end
 //------------------------------------------------------------

 //------------------syn_flip_flop_inst-------------------
 syn_flip_flop syn_flip_flop_inst
 (
 .sys_clk (sys_clk ), //input sys_clk
 .sys_rst_n (sys_rst_n ), //input sys_rst_n
 .key_in (key_in ), //input key_in

 .led_out (led_out ) //output led_out
 );

 endmodule