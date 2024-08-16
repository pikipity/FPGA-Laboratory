module half_adder
(
input wire in1 , //first input
input wire in2 , //second input

output wire sum , //Addition of two inputs 
output wire cout //Carry-on after adding two inputs
);


assign {cout, sum} = in1 + in2;

endmodule