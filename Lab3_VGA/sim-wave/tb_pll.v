`timescale 1ns/1ps

module tb_pll();

// Declare artificial input signal
reg artificial_sys_clk;
reg artificial_sys_rst_n;
// Declare output record signal
wire recoder_vga_clk;

// Define waveform record file
initial begin
    $dumpfile("signals_tb_pll.vcd");
    $dumpvars(0, tb_pll);
end

// Define stop time
initial begin
    #30000000
    $finish;
end

// Generate artificial inputs
// Define the initial value of the artificial inputs
 initial begin
	 artificial_sys_clk <= 1'b1;
	 artificial_sys_rst_n <= 1'b0;
	 #200
	 artificial_sys_rst_n <= 1'b1;
 end
//Generate system clock, 50MHz
 always #10 artificial_sys_clk <= ~artificial_sys_clk ;

 //------------- clk_gen_inst -------------
 pll pll_inst
 (
 .sys_clk(artificial_sys_clk),
 .sys_rst_n(artificial_sys_rst_n),

 .vga_clk(recoder_vga_clk)
 );

endmodule