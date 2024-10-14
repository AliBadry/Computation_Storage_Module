// File : Computational_storage
// Author : Ali Badry
// Date : 26/9/2024
// Version : 1
// Abstract : this is a memory computation storage unit that has four operations
//            [memory read - memory write - addition & storage - subtraction and storage]

module Computational_storage #(
    parameter   MEM_WIDTH = 8,
                MEM_DEPTH = 16,
                NO_OPERATIONS = 4
) (
    input logic                             clk, rst_n,
    input logic [$clog2(MEM_DEPTH)-1:0]     addA, addB, addC,
    input logic [$clog2(NO_OPERATIONS)-1:0] operation_select,
    inout logic  [MEM_WIDTH-1:0]             DQ
);
//================================== //
//      Defining internal signals    //
//===================================//
logic [$clog2(MEM_DEPTH)-1:0]   addr_port1;
logic [MEM_WIDTH-1:0]           in_port1;
logic [MEM_WIDTH-1:0]           out_port1;
logic                           mux1,mux2;
logic                           RD_en1,RD_en2,WR_en1;
logic [MEM_WIDTH-1:0]           arith_unit_out;
logic [MEM_WIDTH-1:0]           arith_unit_in1, arith_unit_in2;
logic                           arith_op;

//======================================================= //
//      Defining the signals required to derive the DQ    //
//========================================================//  
logic DQ_out_enable; // 1: an indication that DQ will output data from this module -- 0: an indication that DQ will input data to this module
logic [MEM_WIDTH-1:0] DQ_out; // intermediate stage to store output data

assign DQ = DQ_out_enable? DQ_out :'bz;

//=========================================================== //
//      Implementing MUX logic and internal connections       //
//============================================================//
assign addr_port1       = mux1? addC            :addA;
assign in_port1         = mux2? arith_unit_out  :DQ;
assign DQ_out           = out_port1;
assign arith_unit_in1   = out_port1;

//===================================================== //
//          Instantiating the memory we operate on      //
//===================================================== //

Dual_port_RAM #(.MEM_WIDTH(MEM_WIDTH), .MEM_DEPTH(MEM_DEPTH)) RAM1 (
    .clk        (clk            ),
    .rst_n      (rst_n          ),
    .addr_port1 (addr_port1     ),
    .addr_port2 (addB           ),
    .in_port1   (in_port1       ),
    .in_port2   (8'b0           ),
    .RD_en1     (RD_en1         ),
    .RD_en2     (RD_en2         ),
    .WR_en1     (WR_en1         ),
    .WR_en2     (1'b0           ),
    .out_port1  (out_port1      ),
    .out_port2  (arith_unit_in2 )
);
// we will assume that this memory doesn't get reseted 
// to zero instead, it will be preloaded with specific values

//===================================================== //
//          Instantiating the controller                //
//===================================================== //
Controller CU1(
    .clk                (clk                ),
    .rst_n              (rst_n              ),
    .mux1               (mux1               ),
    .mux2               (mux2               ),
    .arith_op           (arith_op           ),
    .RD_en1             (RD_en1             ),
    .RD_en2             (RD_en2             ),
    .WR_en1             (WR_en1             ),
    .operation_select   (operation_select   )
);

//===================================================== //
//          Instantiating the arithmetic unit           //
//===================================================== //
Arthmetic_unit #(.WIDTH(MEM_WIDTH)) AU1 (
    .in1        (arith_unit_in1 ),
    .in2        (arith_unit_in2 ),
    .arith_op   (arith_op       ),
    .out        (arith_unit_out )
);

// ============================================= //
//          Inout DQ selection condition            //
// ============================================= //
always_comb begin
    if(operation_select == 'h0)
        DQ_out_enable   = 1'b1;
    else
        DQ_out_enable   = 1'b0;
end
    
endmodule