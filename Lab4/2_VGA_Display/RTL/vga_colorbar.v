module vga_colorbar(
input wire sys_clk , //输入工作时钟,频率50MHz
input wire sys_rst_n , //输入复位信号,低电平有效

output wire hsync , //输出行同步信号
output wire vsync , //输出场同步信号
output wire [15:0] rgb //输出像素信息

);

 ////
 //\* Parameter and Internal Signal \//
 ////

 //wire define
 wire vga_clk ; //VGA工作时钟,频率25MHz
 wire locked ; //PLL locked信号
 wire rst_n ; //VGA模块复位信号
 wire [9:0] pix_x ; //VGA有效显示区域X轴坐标
 wire [9:0] pix_y ; //VGA有效显示区域Y轴坐标
 wire [15:0] pix_data; //VGA像素点色彩信息

 //rst_n:VGA模块复位信号
 assign rst_n = (sys_rst_n & locked);

 ////
 //\* Instantiation \//
 ////

 //------------- clk_gen_inst -------------
 clk_gen clk_gen_inst
 (
 .areset (~sys_rst_n ), //输入复位信号,高电平有效,1bit
 .inclk0 (sys_clk ), //输入50MHz晶振时钟,1bit

 .c0 (vga_clk ), //输出VGA工作时钟,频率25MHz,1bit
 .locked (locked ) //输出pll locked信号,1bit
 );

 //------------- vga_ctrl_inst -------------
 vga_ctrl vga_ctrl_inst
 (
 .vga_clk (vga_clk ), //输入工作时钟,频率25MHz,1bit
 .sys_rst_n (rst_n ), //输入复位信号,低电平有效,1bit
 .pix_data (pix_data ), //输入像素点色彩信息,16bit

 .pix_x (pix_x ), //输出VGA有效显示区域像素点X轴坐标,10bit
 .pix_y (pix_y ), //输出VGA有效显示区域像素点Y轴坐标,10bit
 .hsync (hsync ), //输出行同步信号,1bit
 .vsync (vsync ), //输出场同步信号,1bit
 .rgb (rgb ) //输出像素点色彩信息,16bit
 );

 //------------- vga_pic_inst -------------
 vga_pic vga_pic_inst
 (
 .vga_clk (vga_clk ), //输入工作时钟,频率25MHz,1bit
 .sys_rst_n (rst_n ), //输入复位信号,低电平有效,1bit
 .pix_x (pix_x ), //输入VGA有效显示区域像素点X轴坐标,10bit
 .pix_y (pix_y ), //输入VGA有效显示区域像素点Y轴坐标,10bit

 .pix_data (pix_data ) //输出像素点色彩信息,16bit

 );

 endmodule