`timescale 1ns/1ps

module tb_vga_colorbar();

// Declare artificial input signal
 reg sys_clk ;
 reg sys_rst_n ;
// Declare output record signal
wire hsync ;
wire [15:0] rgb ;
wire vsync ;

// Define waveform record file
initial begin
    $dumpfile("signals_tb_vga_colorbar.vcd");
    $dumpvars(0, tb_vga_colorbar);
end

// Define stop time
initial begin
    #30000000
    $finish;
end

// Generate artificial inputs
// Define the initial value of the artificial inputs
 initial begin
	 sys_clk = 1'b1;
	 sys_rst_n <= 1'b0;
	 #200
	 sys_rst_n <= 1'b1;
 end
 //Generate system clock, 50MHz
 always #10 sys_clk = ~sys_clk ;

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