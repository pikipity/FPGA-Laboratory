`timescale 1ns/1ps

module led (
    input wire key_in,
    output wire led_out
);

assign led_out = key_in;
    
endmodule