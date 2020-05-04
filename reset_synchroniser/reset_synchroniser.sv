//Converts an async reset into a sync reset lasting one clock pulse

module reset_sync #(
    INPUT_POLARITY=1'b0,   //Active low
    OUTPUT_POLARITY=1'b1   //Active high
)(
    input logic async_reset_i, clk,
    output logic sync_reset_o
);
    
logic [2:0] reset_sync;
logic async_reset;
assign async_reset = async_reset_i^INPUT_POLARITY;

always_ff @(posedge clk, negedge async_reset) begin
    if(~async_reset) begin
        reset_sync[0] <= 1'b0;
    end else begin
        reset_sync <= {reset_sync[1:0], 1'b1};
    end
    
end

assign sync_reset_o = reset_sync[2]^OUTPUT_POLARITY;

endmodule