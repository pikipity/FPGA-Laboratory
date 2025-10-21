`timescale 1ns / 1ps

module vga_pic_move_ball_click_debounce(
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

// Debounce
parameter CNT_20MS_MAX = 20'd500000;
reg key_up_flag;
// counter for press
reg [0:19] cnt_press_20ms;
always @(posedge vga_clk or negedge sys_rst_n) begin
    if (!sys_rst_n) begin
        cnt_press_20ms <= 20'b0;
    end else if (up) begin
        cnt_press_20ms <= 20'b0;
    end else if (cnt_press_20ms == CNT_20MS_MAX && !up) begin
        cnt_press_20ms <= cnt_press_20ms;
    end else begin
        cnt_press_20ms <= cnt_press_20ms + 1'b1;
    end 
end
// counter for release
reg [0:19] cnt_release_20ms;
always @(posedge vga_clk or negedge sys_rst_n) begin
    if (!sys_rst_n) begin
        cnt_release_20ms <= 20'b0;
    end else if (!up) begin
        cnt_release_20ms <= 20'b0;
    end else if (cnt_release_20ms == CNT_20MS_MAX && up) begin
        cnt_release_20ms <= cnt_release_20ms;
    end else begin
        cnt_release_20ms <= cnt_release_20ms + 1'b1;
    end 
end
// update key_up_flag
always @(posedge vga_clk or negedge sys_rst_n) begin
    if (!sys_rst_n) begin
        key_up_flag <= 1'b1;
    end else if (cnt_press_20ms >= CNT_20MS_MAX - 1'd1) begin
        key_up_flag <= 1'b0;
    end else if (cnt_release_20ms >= CNT_20MS_MAX - 1'd1) begin
        key_up_flag <= 1'b1;
    end else begin
        key_up_flag <= key_up_flag;
    end
end



// detect edge of button
reg up_prev = 1;            // store button state in previous clock
wire up_falling_edge;       // detect button edge

always @(posedge vga_clk or negedge sys_rst_n) begin
    if (!sys_rst_n) begin
        up_prev <= 1;
    end else begin
        up_prev <= key_up_flag;
    end
end

// detect the negedge
assign up_falling_edge = (up_prev == 1 && key_up_flag == 0);


// move ball
always @(posedge vga_clk or negedge sys_rst_n) begin
    if (!sys_rst_n) begin
        // reset
        ball_x <= 320;
        ball_y <= 240;
    end 
    else begin
        // negedge of button -> ball move
        if (up_falling_edge) 
            if (ball_y > BALL_RADIUS)
                ball_y <= ball_y - 10;

    end
end

// generate color
always @(*) begin
    if ((pix_x - ball_x) * (pix_x - ball_x) + (pix_y - ball_y) * (pix_y - ball_y) <= BALL_RADIUS * BALL_RADIUS) begin
        pix_data = BALL_COLOR; 
    end else begin
        pix_data = BACKGROUND_COLOR; 
    end
end
	 
	 

 endmodule