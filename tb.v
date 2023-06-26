module tb();
    
    reg rst, wr_clk, rd_clk, wr_en, rd_en;
    reg [31:0] din;

    wire full, empty, valid;
    wire [255:0] dout;
    wire [9:0] wr_count;
    wire [6:0] rd_count;
    wire wr_rst_busy, rd_rst_busy;

    always #5 wr_clk = ~wr_clk; // 100M
    always #10 rd_clk = ~rd_clk; // 10M

    initial begin
        wr_clk = 1;
        rd_clk = 1;
        rst = 1;
        
        #5 // so inputs change @ negedge, clearer

        #200 rst = 0;
        
        #300 din = 32'h000fffff;
            wr_en = 1;

        #10 din = 32'h000eeeee;
        #10 din = 32'h000ddddd;
        #10 din = 32'h000ccccc;

        #500 wr_en = 0;
    end

    top DUT(
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
        .rd_count(rd_count),
        .wr_count(wr_count),
        .wr_rst_busy(wr_rst_busy),
        .rd_rst_busy(rd_rst_busy)
    );

endmodule