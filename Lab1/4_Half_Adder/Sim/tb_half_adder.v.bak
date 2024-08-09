`timescale 1ns/1ns
module tb_half_adder();

reg in1;
reg in2;

wire sum;
wire cout;

 
initial begin
in1 <= 1'b0;
in2 <= 1'b0;
end

always #10 in1 <= {$random} % 2;

always #10 in2 <= {$random} % 2;

//------------------------------------------------------------
initial begin
$timeformat(-9, 0, "ns", 6);
$monitor("@time %t:in1=%b in2=%b sum=%b cout=%b",$time,in1,in2,sum,cout);
end
//------------------------------------------------------------

//--------------------half_adder_inst-----------------
half_adder half_adder_inst
(
.in1 (in1 ), //input in1
.in2 (in2 ), //input in2

.sum (sum ), //output sum
.cout (cout ) //output cout
);

 endmodule