`timescale 1ns/1ps

module vending_machine_moore (
    input wire clk,
    input wire rstn,
    input wire [1:0] coin,

    output wire [1:0] change,
    output wire sell
);

// machine state decode
parameter IDLE = 3'd0,
          GET05 = 3'd1,
          GET10 = 3'd2,
          GET15 = 3'd3,
          GET20 = 3'd4,
          GET25 = 3'd5;

// machine variable
reg [2:0] st_next;
reg [2:0] st_cur;

// define how to transfer the state
always @(posedge clk or negedge rstn) begin
    if(!rstn) begin
        st_cur <= IDLE;
    end
    else begin
        st_cur <= st_next;
    end
end

// define how to determine the next state
always @(*) begin
    case(st_cur)
        IDLE: 
            case(coin)
                2'd1: st_next = GET05;
                2'd2: st_next = GET10;
                default: st_next = IDLE;
            endcase
        GET05:
            case(coin)
                2'd1: st_next = GET10;
                2'd2: st_next = GET15;
                default: st_next = GET05;
            endcase
        GET10:
            case(coin)
                2'd1: st_next = GET15;
                2'd2: st_next = GET20;
                default: st_next = GET10;
            endcase
        GET15:
            case(coin)
                2'd1: st_next = GET20;
                2'd2: st_next = GET25;
                default: st_next = GET15;
            endcase
        GET20: st_next = IDLE;
        GET25: st_next = IDLE;
        default:
            st_next = IDLE;
    endcase
end

// define how to generate outputs
reg [1:0] change_r;
reg sell_r;

always @(posedge clk or negedge rstn) begin
    if (!rstn) begin
        change_r <= 2'd0;
        sell_r <= 1'd0;
    end
    else if (st_cur == GET20) begin
        change_r <= 2'd0;
        sell_r <= 1'd1;
    end
    else if (st_cur == GET25) begin
        change_r <= 2'd1;
        sell_r <= 1'd1;
    end
    else begin
        change_r <= 2'd0;
        sell_r <= 1'd0;
    end
end

assign sell = sell_r;
assign change = change_r;
    
endmodule