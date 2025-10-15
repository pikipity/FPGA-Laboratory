`timescale 1ns/1ps

module pll(
    input wire sys_clk , //System Clock, 50MHz
    input wire sys_rst_n , //Reset signal. Low level is effective

    output wire vga_clk // VGA Clock, 25MHz
);

reg clk_25;
always @(posedge sys_clk or negedge sys_rst_n) begin
    if (!sys_rst_n) begin
        clk_25 <= 0;
    end else begin
        clk_25 <= ~clk_25;
    end
end

assign vga_clk = clk_25;

endmodule