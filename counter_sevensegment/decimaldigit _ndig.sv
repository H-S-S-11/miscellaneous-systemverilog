/////////////////////////////////////////////////////////////////////
// Design unit: decimaldigitndig
//            :
// File name  : twodigit_ndig.sv
//            :
// Description: Displays an n-bit value on one 7-segment displays
//            : Active Low outputs
//        
//            : 
// System     : SystemVerilog IEEE 1800-2005
//
//Author      : Harry Snell 24/11/2019
////////////////////////////////////////////////////////////////////

module decimaldigitndig #(
    parameter COUNTWIDTH = 6,
    parameter POSITION = 0
)
(output logic [6:0] data, output logic[COUNTWIDTH-1:0] reduced_number,
    input logic [COUNTWIDTH-1:0] number);

logic [3:0] address;

sevenseg disp0(.*);


always_comb begin
    //default
    address = 'x;
    reduced_number = 'x;
    
    
    if (number>=(9*(10**POSITION))) begin
        address = 9;
        reduced_number = (number - 9*(10**POSITION));
    end
    if ((number>=(8*(10**POSITION))) && (number<(9*(10**POSITION)))) begin
        address = 8;
        reduced_number = (number - 8*(10**POSITION));
    end
    if ((number>=(7*(10**POSITION))) && (number<(8*(10**POSITION)))) begin
        address = 7;
        reduced_number = (number - 7*(10**POSITION));
    end
    if ((number>=(6*(10**POSITION))) && (number<(7*(10**POSITION)))) begin
        address = 6;
        reduced_number = (number - 6*(10**POSITION));
    end
    if ((number>=(5*(10**POSITION))) && (number<(6*(10**POSITION)))) begin
        address = 5;
        reduced_number = (number - 5*(10**POSITION));
    end
    if ((number>=(4*(10**POSITION))) && (number<(5*(10**POSITION)))) begin
        address = 4;
        reduced_number = (number - 4*(10**POSITION));
    end 
    if ((number>=(3*(10**POSITION))) && (number<(4*(10**POSITION)))) begin
        address = 3;
        reduced_number = (number - 3*(10**POSITION));
    end
    if ((number>=(2*(10**POSITION))) && (number<(3*(10**POSITION)))) begin
        address = 2;
        reduced_number = (number - 2*(10**POSITION));
    end
    if ((number>=(1*(10**POSITION))) && (number<(2*(10**POSITION)))) begin
        address = 1;
        reduced_number = (number - 1*(10**POSITION));
    end
    if (number<(1*(10**POSITION))) begin
        address = 0;
        reduced_number = number;
    end

end
endmodule