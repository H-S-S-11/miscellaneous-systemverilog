//Testing reset_sync

module test_reset_sync();

logic clk, async_reset, sync_reset;
    
reset_sync #(
    .INPUT_POLARITY(0),
    .OUTPUT_POLARITY(1)
)   sync_1(
    .clk(clk),
    .async_reset_i(async_reset),
    .sync_reset_o(sync_reset)
);

initial begin
    clk = 0;
    async_reset = 1;
    #10ns async_reset = 0;
    #10ns async_reset = 1;
    #20ns async_reset = 0;
    #60ns async_reset = 1;
end

always begin
    #5ns clk = ~clk;
end

endmodule