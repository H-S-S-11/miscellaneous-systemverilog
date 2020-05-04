/////////////////////////////////////////////////////////////////////
// Design unit: sevenseg
//            :
// File name  : sevenseg.sv
//            :
// Description: Seven segment decoder described as ROM
//            : Active Low outputs
//            :
// Limitations: None
//            : 
// System     : SystemVerilog IEEE 1800-2005
//            :
// Author     : Mark Zwolinski
//            : School of Electronics and Computer Science
//            : University of Southampton
//            : Southampton SO17 1BJ, UK
//            : mz@ecs.soton.ac.uk
//
// Revision   : Version 1.1 31/07/17


// Edited 21/11/2019 Harry Snell
/////////////////////////////////////////////////////////////////////

module sevenseg(output logic [6:0] data, 
                input logic [3:0] address);

always_comb
  unique casez (address)
    4'b0000 : data = 7'b1000000; // 0
    4'b0001 : data = 7'b1111001; // 1
    4'b0010 : data = 7'b0100100; // 2
    4'b0011 : data = 7'b0110000; // 3
    4'b0100 : data = 7'b0011001; // 4
    4'b0101 : data = 7'b0010010; // 5
    4'b0110 : data = 7'b0000010; // 6
    4'b0111 : data = 7'b1111000; // 7
    4'b1000 : data = 7'b0000000; // 8
    4'b1001 : data = 7'b0010000; // 9
    4'b1010 : data = 7'b0001000; // A
    4'b1011 : data = 7'b0000011; // B
    4'b1100 : data = 7'b1000110; // C
    4'b1101 : data = 7'b0100001; // D
    4'b1110 : data = 7'b0000110; // E
    4'b1111 : data = 7'b0001110; // F
    default : data = 7'b1111111;
  endcase
endmodule

