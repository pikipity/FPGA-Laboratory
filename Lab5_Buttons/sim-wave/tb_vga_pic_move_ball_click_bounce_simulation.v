`timescale 1ns / 1ps

`timescale 1ns / 1ps

module tb_vga_pic_move_ball_click_bounce_simulation();

// Declare artificial input signal
reg artificial_vga_clk;
reg artificial_sys_rst_n;

reg artificial_up;
// Declare output record signal
wire [15:0] record_rgb;
wire record_hsync;
wire record_vsync;

// Define waveform record file
initial begin
    $dumpfile("signals_tb_vga_pic_move_ball_click_bounce_simulation.vcd");
    $dumpvars(0, tb_vga_pic_move_ball_click_bounce_simulation);
end

// Define stop time
initial begin
    #500000000
    $finish;
end

// Generate artificial inputs
// Define the initial value of the artificial inputs
 initial begin
	 artificial_vga_clk <= 1'b1;
     artificial_up <= 1;
	 artificial_sys_rst_n <= 1'b1;
	 #200
	 artificial_sys_rst_n <= 1'b0;
     #200
	 artificial_sys_rst_n <= 1'b1;
 end
  //Generate VGA clock 25MHz
 always #20 artificial_vga_clk = ~artificial_vga_clk;

 integer i;
 integer num_bounces;   
 always begin
    #30000000
    artificial_up <= 0;
    // simulate press bounce
    num_bounces = $urandom_range(2, 5);
    for (i=0; i<num_bounces; i=i+1) begin
        #($urandom_range(10, 10000000))
        artificial_up <= 1;
        #($urandom_range(10, 10000000))
        artificial_up <= 0;
    end
    #30000000
    artificial_up <= 1;
    // simulate release bounce
    num_bounces = $urandom_range(2, 5);
    for (i=0; i<num_bounces; i=i+1) begin
        #($urandom_range(10, 10000000))
        artificial_up <= 0;
        #($urandom_range(10, 10000000))
        artificial_up <= 1;
    end
 end

 wire [9:0] pix_x ; //x coordinate of current pixel
 wire [9:0] pix_y ; //y coordinate of current pixel
 wire [15:0] pix_data; //color information

 vga_pic_move_ball_click vga_pic_inst
 (
 .vga_clk (artificial_vga_clk ), //VGA working clock, 25MHz
 .sys_rst_n (artificial_sys_rst_n ), //Reset signal. Low level is effective
 .pix_x (pix_x ), //x coordinate of current pixel
 .pix_y (pix_y ), //y coordinate of current pixel
 
 .up(artificial_up),

 .pix_data (pix_data ) //color information

 );

  vga_ctrl vga_ctrl_inst
 (
 .vga_clk (artificial_vga_clk ), //VGA working clock, 25MHz
 .sys_rst_n (artificial_sys_rst_n ), //Reset signal. Low level is effective
 .pix_data (pix_data ), //color information

 .pix_x (pix_x ), //x coordinate of current pixel
 .pix_y (pix_y ), //y coordinate of current pixel
 .hsync (record_hsync ), //Line sync signal
 .vsync (record_vsync ), //Field sync signal
 .rgb (record_rgb ) //RGB565 color data
 );

endmodule
