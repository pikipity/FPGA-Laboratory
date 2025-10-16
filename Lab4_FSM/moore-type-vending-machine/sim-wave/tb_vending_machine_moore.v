`timescale 1ns/1ps

module tb_vending_machine_moore();

// Declare artificial input signal
reg artificial_clk;
reg artificial_rstn;
reg [1:0] artificial_coin;
// Declare output record signal
wire [1:0] change_record;
wire sell_record;

// Define waveform record file
initial begin
    $dumpfile("signals_tb_vending_machine_moore.vcd");
    $dumpvars(0, tb_vending_machine_moore);
end

// Define stop time
initial begin
    #10000
    $finish;
end

// Generate artificial inputs
// Define the initial value of the artificial inputs
 initial begin
	 artificial_clk = 1'b1;
	 artificial_rstn <= 1'b0;
     artificial_coin <= 2'b0;
	 #200
	 artificial_rstn <= 1'b1;
 end
//Generate system clock, 50MHz
 always #10 artificial_clk = ~artificial_clk ;
 // Every 500 ns, generate a random number. This random number will 
// take the modulus and find the remainder to generate random 0, 1, 2 
always begin
    #500 artificial_coin <= ($urandom) % 3;
    #20 artificial_coin <= 1'b0;
end

// instance
vending_machine_moore vending_machine_moore_inst
(
    .clk(artificial_clk),
    .rstn(artificial_rstn),
    .coin(artificial_coin),

    .change(change_record),
    .sell(sell_record)
);

endmodule