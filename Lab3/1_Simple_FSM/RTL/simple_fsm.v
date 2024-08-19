module simple_fsm
(
 input wire sys_clk, // System clock: 50M Hz
 input wire sys_rst_n, // Reset button
 input wire coin, // Input money: Only can be 0 or 1
 
 output reg cola // Output cola: 0 means taht there is no cola; 
                 //              1 means that there is cola 
);

// machine state decode
parameter IDLE = 3'b001;
parameter ONE = 3'b010;
parameter TWO = 3'b100;

// machine variable
reg [2:0] st_next;
reg [2:0] st_cur;

always @(posedge sys_clk or negedge sys_rst_n) begin
	if (!sys_rst_n) 
		begin
			st_cur <= IDLE;
		end
	else
		begin
			st_cur <= st_next;
		end
end

always @(*) begin
	case(st_cur)
		IDLE: 
			if (coin == 1'b1) 
				st_next = ONE;
			else
				st_next = IDLE;
		ONE:
			if (coin==1'b1)
				st_next = TWO;
			else
				st_next = ONE;
		TWO:
			if (coin==1'b1)
				st_next = IDLE;
			else
				st_next = TWO;
		default: 
			st_next = IDLE;
	endcase
end

always @(posedge sys_clk or negedge sys_rst_n) begin
	if (!sys_rst_n) 
		cola <= 1'b0;
	else if ((st_cur == TWO) && (coin == 1'b1))
		cola <= 1'b1;
	else
		cola <= 1'b0;
end



endmodule