module latch_3
(
input wire in1 , //1st input
input wire in2 , //2nd input
input wire in3 , //3rd input

output reg [7:0] out //Output
);

 always@(*)
 if({in1, in2, in3} == 3'b000)
 out = 8'b0000_0001;
 else if({in1, in2, in3} == 3'b001)
 out = 8'b0000_0010;
 else if({in1, in2, in3} == 3'b010)
 out = 8'b0000_0100;
 else if({in1, in2, in3} == 3'b011)
 out = 8'b0000_1000;
 else if({in1, in2, in3} == 3'b100)
 out = 8'b0001_0000;
 else if({in1, in2, in3} == 3'b101)
 out = 8'b0010_0000;
 else if({in1, in2, in3} == 3'b110)
 out = 8'b0100_0000;
 else if({in1, in2, in3} == 3'b111)
 out = 8'b1000_0000;
 else
 // out = 8'b0000_0001;
 out = out;
 
endmodule