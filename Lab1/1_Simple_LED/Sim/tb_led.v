// Define simulation parameter
`timescale 1ns/1ns // The first number is the time unit.
                    // The second number is the time precision.
						  // In line 22, "#10" means that this line will redo every 10 ns

// Define the testbench module
module tb_led();

// Parameter and Internal Signal
//wire define
wire led_out ;
//reg define
reg key_in ;

// Main Code
//init input signal
initial key_in <= 1'b0;

// Generate inputs to simulate the button press
// Every 10 ns, generate a random number. This random number will 
// take the modulus and find the remainder to generate random 0 and 1 
always #10 key_in <= {$random} % 2;

// Instantiate the testbench
led led_inst
(
.key_in (key_in ), //input key_in

.led_out(led_out) //output led_out
);

endmodule