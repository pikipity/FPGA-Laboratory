module mux2_1
(
input wire in1, //input1
input wire in2, //input2
input wire sel, //selection

output wire out //output
);


 assign out = (sel == 1'b1) ? in1 : in2;

 endmodule