`timescale 1ns / 1ps

module vga_pic_static_ball(
input wire vga_clk , //VGA working clock, 25MHz
input wire sys_rst_n , //Reset signal. Low level is effective
input wire [9:0] pix_x , //X coordinate of current pixel
input wire [9:0] pix_y , //Y coordinate of current pixel

input wire up,

output reg [15:0] pix_data //Color information

);

 ////
 //\* Parameter and Internal Signal \//
 ////
 // parameters of display region
 parameter H_VALID = 10'd640 , //Maximum x value
 V_VALID = 10'd480 ; //Maximum y value

// parameters of colors
 parameter BLUE = 16'h001F, //Blue
           PURPPLE = 16'hF81F; //Purple

// parameters of ball
reg [9:0] ball_x = 320;         // x corrdinate
reg [9:0] ball_y = 240;         // y coordinate
parameter BALL_RADIUS = 20;     // radius
parameter BALL_COLOR = BLUE;    // ball color
parameter BACKGROUND_COLOR = PURPPLE; // background color



// generate color
always @(*) begin
    if ((pix_x - ball_x) * (pix_x - ball_x) + (pix_y - ball_y) * (pix_y - ball_y) <= BALL_RADIUS * BALL_RADIUS) begin
        pix_data = BALL_COLOR; 
    end else begin
        pix_data = BACKGROUND_COLOR; 
    end
end
	 
	 

 endmodule