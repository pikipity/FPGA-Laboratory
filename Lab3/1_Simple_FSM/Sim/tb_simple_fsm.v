`timescale 1ns/1ns
module tb_simple_fsm();

 //reg define
 reg sys_clk ;
 reg sys_rst_n ;
 reg coin ;

 //wire define
 wire cola;


 //Init inputs
 initial begin
 sys_clk = 1'b1;
 sys_rst_n <= 1'b0;
 #20
 sys_rst_n <= 1'b1;
 end

 //Simulate system clock (50M Hz)
 always #10 sys_clk = ~sys_clk;

 //Generate the random input
 always@(posedge sys_clk or negedge sys_rst_n)
 if(sys_rst_n == 1'b0)
 coin <= 1'b0;
 else
 coin <= {$random} % 2; //取模求余数，产生非负随机数0、1

 //------------------------------------------------------------
 //Get the internal variables of the instance "simple_fsm_inst"
 wire [2:0] st_cur = simple_fsm_inst.st_cur;
 wire [2:0] st_next = simple_fsm_inst.st_next;
 //-------------------------------------------------------------

 initial begin
 $timeformat(-9, 0, "ns", 6);
 $monitor("@time %t: coin=%b st_cur=%b st_next=%b cola=%b",
 $time, coin, st_cur, st_next, cola);
 end
 //------------------------------------------------------------


 //------------------------simple_fsm_inst------------------------
 simple_fsm simple_fsm_inst(
 .sys_clk (sys_clk ), //input sys_clk
 .sys_rst_n (sys_rst_n ), //input sys_rst_n
 .coin (coin ), //input coin

 .cola (cola ) //output cola
 );

 endmodule