`timescale 1ns/1ns 

module tb_latch_2();

reg in1;
reg in2;
reg in3;

wire [7:0] out;

//Init inputs
 initial begin
 in1 <= 1'b0;
 in2 <= 1'b0;
 in3 <= 1'b0;
 end
 
 always #10 in1 <= {$random} % 2;


 always #10 in2 <= {$random} % 2;


 always #10 in3 <= {$random} % 2;
 
 //------------------------------------------------------------
 initial begin
 $timeformat(-9, 0, "ns", 6);
 $monitor("@time %t:in1=%b in2=%b in3=%b out=%b",
 $time,in1,in2,in3,out);
 end
 //------------------------------------------------------------

 //---------------latch_2_inst------------------
 latch_2 latch_2_inst(
 .in1 (in1 ), //input in1
 .in2 (in2 ), //input in2
 .in3 (in3 ), //input in3

 .out (out ) //output out
 );

endmodule