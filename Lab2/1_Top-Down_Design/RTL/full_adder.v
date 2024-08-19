module full_adder
(
input wire in1 , //addend
input wire in2 , //augend
input wire cin , //carry-on from lower bit

output wire sum , //sum
output wire cout //carry-on
);

 //wire define
 wire h0_sum ;

 wire h0_cout;

 wire h1_cout;

 //------------------------half_adder_inst0------------------------
 half_adder half_adder_inst0
 (
 .in1 (in1 ),
 .in2 (in2 ), 

 .sum (h0_sum ), 
 .cout (h0_cout) 
 );

 //------------------------half_adder_inst1------------------------
 half_adder half_adder_inst1
 (
 .in1 (h0_sum ),
 .in2 (cin ), 

 .sum (sum ), 
 .cout (h1_cout) 
 );

 //Final count
 assign cout = h0_cout | h1_cout;

 endmodule