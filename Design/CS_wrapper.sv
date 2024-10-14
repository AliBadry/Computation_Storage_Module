// File : CS_wrapper
// Author : Ali Badry
// Date : 26/9/2024
// Version : 1
// Abstract : this is wrapper that connects the interface with module
module CS_wrapper #(
    parameter   MEM_WIDTH = 8,
                MEM_DEPTH = 16,
                NO_OPERATIONS = 4
) (
    interface CS_intf1
);
//================================================== //
//          defining the internal signals            //
//================================================== //

logic                             clk, rst_n;
logic [$clog2(MEM_DEPTH)-1:0]     addA, addB, addC;
logic [$clog2(NO_OPERATIONS)-1:0] operation_select;
wire  [MEM_WIDTH-1:0]             DQ;
//logic [MEM_WIDTH-1:0]             intf_ram  [0:MEM_DEPTH-1];
//=========================================================== //
//          connecting the DUT with the interface             //
//=========================================================== //

assign clk              = CS_intf1.clk;
assign rst_n            = CS_intf1.rst_n;
assign addA             = CS_intf1.addA;
assign addB             = CS_intf1.addB;
assign addC             = CS_intf1.addC;
assign operation_select = CS_intf1.operation_select;
assign CS_intf1.DQ      = U_CS1.DQ_out_enable? DQ:'bz;
assign DQ               = !U_CS1.DQ_out_enable? CS_intf1.DQ:'bz;
assign CS_intf1.intf_ram= U_CS1.RAM1.RAM;
//assign U_CS1.RD_en1     = CS_intf1.RD_en1;
//assign U_CS1.RD_en2     = CS_intf1.RD_en2;
//assign U_CS1.WR_en1     = CS_intf1.WR_en1;
//========================================== //
//          instantiating the DUT            //
//========================================== //

Computational_storage #(.MEM_WIDTH      (MEM_WIDTH),
                        .MEM_DEPTH      (MEM_DEPTH),
                        .NO_OPERATIONS  (NO_OPERATIONS)
) U_CS1 (   .clk                (clk                ),
            .rst_n              (rst_n              ),
            .addA               (addA               ),
            .addB               (addB               ),
            .addC               (addC               ),
            .operation_select   (operation_select   ),
            .DQ                 (DQ                 )
        );
    
endmodule