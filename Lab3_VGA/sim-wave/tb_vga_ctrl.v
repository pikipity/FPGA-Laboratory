`timescale 1ns/1ps


module tb_vga_ctrl();

// Declare artificial input signal
 reg [15:0] pix_data ;
 reg vga_clk ;
 reg rst_n ;
// Declare output record signal
 wire [9:0] pix_x ; 
 wire [9:0] pix_y ; 
 wire hsync ; 
 wire vsync ; 
 wire [15:0] rgb; 

// Define waveform record file
initial begin
    $dumpfile("signals_tb_vga_ctrl.vcd");
    $dumpvars(0, tb_vga_ctrl);
end

// Define stop time
initial begin
    #30000000
    $finish;
end


// Generate artificial inputs
// Define the initial value of the artificial inputs
 initial begin
	 vga_clk = 1'b1;
	 rst_n <= 1'b0;
	 #200
	 rst_n <= 1'b1;
 end
 //Generate VGA clock 25MHz
 always #20 vga_clk = ~vga_clk;
 //Generate input pix signal
 always@(posedge vga_clk or negedge rst_n) begin
	 if(!rst_n)
		pix_data <= 16'h0000;
	 else
		pix_data <= 16'hffff;
 end


 //------------- vga_ctrl_inst -------------
 vga_ctrl vga_ctrl_inst
 (
 .vga_clk (vga_clk ), 
 .sys_rst_n (rst_n ), 
 .pix_data (pix_data ), 

 .pix_x (pix_x ), 
 .pix_y (pix_y ), 
 .hsync (hsync ), 
 .vsync (vsync ), 
 .rgb (rgb ) 
 );

 endmodule