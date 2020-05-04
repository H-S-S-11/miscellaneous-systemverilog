/////////////////////////////////////////////////////////////////////
// Design unit: test_decimaldigit_ndig
//            :
// File name  : test_twodigit_nbit.sv
//            :
// Description: tests twodigit_nbit.sv
//            : Active Low outputs
//        
//            : 
// System     : SystemVerilog IEEE 1800-2005
//
//Author      : Harry Snell 24/11/2019
////////////////////////////////////////////////////////////////////

module test_decimaldigitndig;

logic [6:0] data;
logic [5:0] reduced_number;  
logic [5:0] number;

decimaldigitndig #(.POSITION(1)) display(.*);


initial

    begin
    number = 'X;
    for (logic [5:0] i=0; i<64; i++) begin
        #10ns number = i;        
    end
    end

endmodule