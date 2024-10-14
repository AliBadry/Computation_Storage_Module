// File : Dual port RAM
// Author : Ali Badry
// Date : 26/9/2024
// Version : 1
// Abstract : Implementing dual port ram to simulate real hardware RAMs
module Dual_port_RAM #(
    parameter   MEM_WIDTH = 8,
                MEM_DEPTH = 16
)(
    input   logic                           clk, rst_n,
    input   logic [$clog2(MEM_DEPTH)-1:0]   addr_port1, addr_port2,
    input   logic [MEM_WIDTH-1:0]           in_port1, in_port2,
    input   logic                           RD_en1, WR_en1,
    input   logic                           RD_en2, WR_en2,
    output  logic [MEM_WIDTH-1:0]           out_port1,out_port2
);

logic [MEM_WIDTH-1:0] RAM [0:MEM_DEPTH-1];

always_ff @( posedge clk , negedge rst_n) begin
    if(!rst_n)begin
        out_port1 <= 'b0;
        out_port2 <= 'b0;
    end
    else begin
//============port1 conditions===========================//
         if(RD_en1) out_port1        <= RAM[addr_port1];
    else if(WR_en1) RAM[addr_port1]  <= in_port1;
//============port2 conditions===========================//
         if(RD_en2) out_port2        <= RAM[addr_port2];
    else if(WR_en2) RAM[addr_port2]  <= in_port2;
    end
end
    
endmodule