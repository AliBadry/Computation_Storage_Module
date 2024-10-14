// File : Arithmetic unit
// Author : Ali Badry
// Date : 26/9/2024
// Version : 1
// Abstract : Implementing arithmetic operations done on memory stored elements 
module Arthmetic_unit #(
    parameter WIDTH = 8
) (
    input   logic               arith_op,
    input   logic [WIDTH-1:0]   in1,in2,
    output  logic [WIDTH-1:0]   out
);

assign out = arith_op?(in1-in2):(in1+in2);
    
endmodule