// File : CS_interface
// Author : Ali Badry
// Date : 26/9/2024
// Version : 1
// Abstract : this is an interface to the memory computation storage unit 

interface CS_interface #(
    parameter   MEM_WIDTH = 8,
                MEM_DEPTH = 16,
                NO_OPERATIONS = 4
)
(input logic                    clk
);
    logic                               rst_n;
    logic [MEM_WIDTH-1:0]               DQ_in, DQ_out;              
    logic [$clog2(MEM_DEPTH)-1:0]       addA, addB, addC;
    logic [$clog2(NO_OPERATIONS)-1:0]   operation_select;
    logic [MEM_WIDTH-1:0]               intf_ram    [0:MEM_DEPTH-1];
    logic                               seq_finished;
    
endinterface