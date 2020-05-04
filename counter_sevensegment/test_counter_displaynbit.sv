/////////////////////////////////////////////////////////////////////
// Design unit: test_counter_displaynbit
//            :
// File name  : test_counter_displaynbit.sv
//            :
// Description: tests counter_displaynbit.sv
//            : Active Low outputs
//        
//            : 
// System     : SystemVerilog IEEE 1800-2005
//
//Author      : Harry Snell 24/11/2019
////////////////////////////////////////////////////////////////////

module test_counter_displaynbit;

parameter NUM_DISPLAYS = 2;
parameter DIV_BITS = 2;

logic [NUM_DISPLAYS-1:0][6:0] data;  
logic count_reset, clk;

counter_displaynbit #( .COUNTER_DIVISIONBITS(DIV_BITS), .NUM_DISPLAYS(NUM_DISPLAYS) )
    displayed_counter( .data(data), .count_reset(count_reset), .clk(clk) );


initial

    begin
    count_reset = 1'b1;
    clk = 1'b0;
    #10ns count_reset = 1'b0;
    #10ns count_reset = 1'b1;

    for (logic [3:0] i=0; i<64; i++) begin
        #10ns clk = 1'b1;
        #10ns clk = 1'b0;        
    end
    end

endmodule