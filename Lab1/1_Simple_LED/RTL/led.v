module led
(
input wire key_in , //input 
output wire led_out //output
);
// Main Code
// Directly connect input and output
assign led_out = key_in;
endmodule