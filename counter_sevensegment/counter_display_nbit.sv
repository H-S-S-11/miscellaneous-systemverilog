//A module that increments a counter on the negative edge of a clock
//Then displays it as a decimal number on two seven-segment displays
//Harry Snell

module counter_displaynbit #(
    parameter COUNTER_DIVISIONBITS = 25,
    parameter NUM_DISPLAYS = 1,
    parameter COUNTER_MAX = (10**NUM_DISPLAYS)-1,
    parameter COUNTER_OUT_WIDTH = $clog2(COUNTER_MAX)
)
(output logic [NUM_DISPLAYS-1:0][6:0] data,
    input logic n_count_reset, clk);

//When connecting signals from different modules together wire is necessary
wire [NUM_DISPLAYS:0][COUNTER_OUT_WIDTH-1:0] number_carry;

genvar i;

generate
    for (i=0; i<NUM_DISPLAYS; i++) begin: display_gen_block
        decimaldigitndig #( .POSITION(i), .COUNTWIDTH(COUNTER_OUT_WIDTH) ) 
            d0(.data(data[i]), .reduced_number(number_carry[i]), .number(number_carry[i+1]));
    end
endgenerate

counternbit  #( .OUTPUTWIDTH(COUNTER_OUT_WIDTH), .DIVISIONBITS(COUNTER_DIVISIONBITS), .MAX(COUNTER_MAX) )
    button_count(.clk(clk), .n_reset(n_count_reset), .value(number_carry[NUM_DISPLAYS]));

endmodule