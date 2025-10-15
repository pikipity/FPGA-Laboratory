`timescale 1ns/1ps

module vga_colorbar(
input wire sys_clk , //System Clock, 50MHz
input wire sys_rst_n , //Reset signal. Low level is effective

output wire hsync , //Line sync signal
output wire vsync , //Field sync signal
output wire [15:0] rgb //RGB565 color data

);

 ////
 //\* Parameter and Internal Signal \//
 ////

 //wire define
 wire vga_clk ; //VGA working clock, 25MHz
 wire [9:0] pix_x ; //x coordinate of current pixel
 wire [9:0] pix_y ; //y coordinate of current pixel
 wire [15:0] pix_data; //color information


 ////
 //\* Instantiation \//
 ////

 //------------- clk_gen_inst -------------
 pll pll_inst
 (
 .sys_clk(sys_clk),
 .sys_rst_n(sys_rst_n),

 .vga_clk(vga_clk)
 );

 //------------- vga_pic_inst -------------
 vga_pic vga_pic_inst
 (
 .vga_clk (vga_clk ), //VGA working clock, 25MHz
 .sys_rst_n (sys_rst_n ), //Reset signal. Low level is effective
 .pix_x (pix_x ), //x coordinate of current pixel
 .pix_y (pix_y ), //y coordinate of current pixel

 .pix_data (pix_data ) //color information
 );

 //------------- vga_ctrl_inst -------------
 vga_ctrl vga_ctrl_inst
 (
 .vga_clk (vga_clk ), //VGA working clock, 25MHz
 .sys_rst_n (sys_rst_n ), //Reset signal. Low level is effective
 .pix_data (pix_data ), //color information

 .pix_x (pix_x ), //x coordinate of current pixel
 .pix_y (pix_y ), //y coordinate of current pixel
 .hsync (hsync ), //Line sync signal
 .vsync (vsync ), //Field sync signal
 .rgb (rgb ) //RGB565 color data
 );

 endmodule