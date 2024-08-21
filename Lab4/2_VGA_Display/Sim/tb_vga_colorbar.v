`timescale 1ns/1ns
module tb_vga_colorbar();
////
//\* Parameter and Internal Signal \//
////
//wire define
wire hsync ;
wire [15:0] rgb ;
wire vsync ;

 //reg define
 reg sys_clk ;
 reg sys_rst_n ;

 ////
 //\* Clk And Rst \//
 ////

 //Init sys_clk, sys_rst_n
 initial begin
	 sys_clk = 1'b1;
	 sys_rst_n <= 1'b0;
	 #200
	 sys_rst_n <= 1'b1;
 end

 //Generate system clock, 50MHz
 always #10 sys_clk = ~sys_clk ;

 ////
 //\* Instantiation \//
 ////

 //------------- vga_colorbar_inst -------------
 vga_colorbar vga_colorbar_inst
 (
 .sys_clk (sys_clk ), 
 .sys_rst_n (sys_rst_n ), 

 .hsync (hsync ), 
 .vsync (vsync ), 
 .rgb (rgb ) 
 );

 endmodule