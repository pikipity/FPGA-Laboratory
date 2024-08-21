module vga_pic(
input wire vga_clk , //VGA working clock, 25MHz
input wire sys_rst_n , //Reset signal. Low level is effective
input wire [9:0] pix_x , //X coordinate of current pixel
input wire [9:0] pix_y , //Y coordinate of current pixel

output reg [15:0] pix_data //Color information

);

 ////
 //\* Parameter and Internal Signal \//
 ////
 //parameter define
 parameter H_VALID = 10'd640 , //Maximum x value
 V_VALID = 10'd480 ; //Maximum y value

 parameter RED = 16'hF800, //RED
 ORANGE = 16'hFC00, //Orange
 YELLOW = 16'hFFE0, //Yellow
 GREEN = 16'h07E0, //Green
 CYAN = 16'h07FF, //Cyan
 BLUE = 16'h001F, //Blue
 PURPPLE = 16'hF81F, //Purple
 BLACK = 16'h0000, //Black
 WHITE = 16'hFFFF, //White
 GRAY = 16'hD69A; //Grey

 ////
 //\* Main Code \//
 ////

 //Generate color data according coordinates
 always@(posedge vga_clk or negedge sys_rst_n) begin
	 if(sys_rst_n == 1'b0)
		pix_data <= 16'd0;
	 else 
		if((pix_x >= 0) && (pix_x < (H_VALID/10)*1))
			pix_data <= RED;
		else if((pix_x >= (H_VALID/10)*1) && (pix_x < (H_VALID/10)*2))
			pix_data <= ORANGE;
		else if((pix_x >= (H_VALID/10)*2) && (pix_x < (H_VALID/10)*3))
			pix_data <= YELLOW;
		else if((pix_x >= (H_VALID/10)*3) && (pix_x < (H_VALID/10)*4))
			pix_data <= GREEN;
		else if((pix_x >= (H_VALID/10)*4) && (pix_x < (H_VALID/10)*5))
			pix_data <= CYAN;
		else if((pix_x >= (H_VALID/10)*5) && (pix_x < (H_VALID/10)*6))
			pix_data <= BLUE;
		else if((pix_x >= (H_VALID/10)*6) && (pix_x < (H_VALID/10)*7))
			pix_data <= PURPPLE;
		else if((pix_x >= (H_VALID/10)*7) && (pix_x < (H_VALID/10)*8))
			pix_data <= BLACK;
		else if((pix_x >= (H_VALID/10)*8) && (pix_x < (H_VALID/10)*9))
			pix_data <= WHITE;
		else if((pix_x >= (H_VALID/10)*9) && (pix_x < H_VALID))
			pix_data <= GRAY;
		else
			pix_data <= BLACK;
 end

 endmodule