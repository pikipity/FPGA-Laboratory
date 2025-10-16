`timescale 1ns/1ps

module tb_asyn_flip_flop();

// Declare artificial input signal
reg artificial_key_in;
reg artificial_rst;
reg artificial_clk;
// Declare output record signal
wire record_led_out;

// Define waveform record file
initial begin
    $dumpfile("signals_tb_asyn_flip_flop.vcd");
    $dumpvars(0, tb_asyn_flip_flop);
end

// Define stop time
initial begin
    #500
    $finish;
end

// Generate artificial inputs
// Define the initial value of the artificial inputs
initial begin
    artificial_key_in <= 1'b1;
    artificial_rst <= 1'b0;
    artificial_clk <= 1'b1;

    //After 20ns, the reset button is released
    #20
    artificial_rst <= 1'b1;

    /*
    In order to observe the difference between synchronous reset and asynchronous reset, 
    the reset button is pressed again after working 210ns.
    The reason for choosing a delay of 210ns instead of 200ns or 220ns is that 
    it can make the reset signal reset at the falling edge of the clock, 
    and the difference between synchronous reset and asynchronous reset can be clearly seen.
    */
    #210
    artificial_rst <= 1'b0; 

    #40
    artificial_rst <= 1'b1; //After 40ns, the reset button is released again
end
/*
 Simulate system clock 50M Hz. The period is 20ns. The half period is 10ns, 
 which means the clock signal is inversed every 10ns.
 */
 always begin
    #10 artificial_clk = ~artificial_clk;
 end 
 // Every 10 ns, generate a random number. This random number will 
// take the modulus and find the remainder to generate random 0 and 1 
// always begin
//     #10 artificial_key_in <= ($random) % 2;
// end

 //------------------asyn_flip_flop_inst-------------------
 asyn_flip_flop asyn_flip_flop_inst
 (
 .sys_clk (artificial_clk ), //input sys_clk
 .sys_rst_n (artificial_rst ), //input sys_rst_n
 .key_in (artificial_key_in ), //input key_in

 .led_out (record_led_out ) //output led_out
 );

endmodule