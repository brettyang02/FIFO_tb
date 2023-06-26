`timescale 1ns / 100ps

module top(
    input wire rst,
    input wire wr_clk, rd_clk,
    input wire [31:0] din,
    input wire wr_en, rd_en,

    output wire [255:0] dout,
    output wire full, empty, valid,
    output wire [9:0] wr_count,
    output wire [6:0] rd_count,
    output wire wr_rst_busy, rd_rst_busy,
    output reg test
    );

    fifo_w32_1024_r256_128 U0 (
        .rst(rst),
        .wr_clk(wr_clk),
        .rd_clk(rd_clk),
        .din(din),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .dout(dout),
        .full(full),
        .empty(empty),
        .valid(valid),
        .rd_data_count(rd_count),
        .wr_data_count(wr_count),
        .wr_rst_busy(wr_rst_busy),
        .rd_rst_busy(rd_rst_busy)
    );
    
    always @(posedge wr_clk) begin
        test <= wr_en;
    end

endmodule