`timescale 1ns/1ns 

module tb_mux2_1();

// These variables will be assigned values using <=, so they must be register
reg in1;
reg in2;
reg sel;

// The outputs in testbench are normally wire.
wire out;


initial
begin 
in1 <= 1'b0;
in2 <= 1'b0;
sel <= 1'b0;
end

// Every 10 ns, generate a random number. This random number will 
// take the modulus and find the remainder to generate random 0 and 1 
always #10 in1 <= {$random} % 2;

// Every 10 ns, generate a random number. This random number will 
// take the modulus and find the remainder to generate random 0 and 1 
always #10 in2 <= {$random} % 2;

// Every 10 ns, generate a random number. This random number will 
// take the modulus and find the remainder to generate random 0 and 1 
always #10 sel <= {$random} % 2;

// This part shows how to print values
// If you do not use ModelSim, this part will be useful
initial begin
$timeformat(-9, 0, "ns", 6);//Set display time format

//When time, in1, in2, sel, or out are changed, the information will be displayed
$monitor("@time %t:in1=%b in2=%b sel=%b out=%b",$time,in1,in2,sel,out);
end
//------------------------------------------------------------



//------------------------mux2_1_inst------------------------
mux2_1 mux2_1_inst 
// The first name is the module name;
// The second name is the instance name.
(
.in1(in1), //input in1
.in2(in2), //input in2
.sel(sel), //inputsel

.out(out) //output out
);

endmodule