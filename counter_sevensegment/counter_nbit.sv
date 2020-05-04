//parameterised positive edge triggered counter for X5
module counternbit #(
  parameter OUTPUTWIDTH = 6,
  parameter DIVISIONBITS = 0,
  parameter MAX = (2**OUTPUTWIDTH)-1,
  parameter TOP = (DIVISIONBITS+OUTPUTWIDTH-1)
)
(input logic clk, n_reset,
output logic [OUTPUTWIDTH-1:0] value);


logic [TOP:0] count, next_count;
logic [OUTPUTWIDTH-1:0] next_value;

assign value = count[TOP:(TOP-OUTPUTWIDTH+1)];
assign next_value = next_count[TOP:(TOP-OUTPUTWIDTH+1)];

always_comb begin
  next_count = count + 1;
end

always_ff @(posedge clk, negedge n_reset)
  if (~n_reset)
    count <= 0;
  else if (next_value > MAX)
    count <= 0;
  else
    count <= next_count;
endmodule
