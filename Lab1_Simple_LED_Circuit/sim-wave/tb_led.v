`timescale 1ns/1ps

module tb_led();

// Declare artificial input signal
reg artificial_key_in;
// Declare output record signal
wire record_led_out;

// Define waveform record file
initial begin
    $dumpfile("signals_tb_led.vcd");
    $dumpvars(0, tb_led);
end

// Define stop time
initial begin
    #10000
    $finish;
end

// Generate artificial inputs
// Define the initial value of the artificial inputs
initial begin
    artificial_key_in <= 1'b0;
end
// Every 10 ns, generate a random number. This random number will 
// take the modulus and find the remainder to generate random 0 and 1 
always begin
    #10 artificial_key_in <= ($random) % 2;
end

// Instantiate the module that is tested
led led_inst(
    .key_in(artificial_key_in),
    .led_out(record_led_out)
);

endmodule
