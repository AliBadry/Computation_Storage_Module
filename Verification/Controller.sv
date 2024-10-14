// File : Controller
// Author : Ali Badry
// Date : 26/9/2024
// Version : 1
// Abstract : Defining controlling signals on the memory and arithmetic unit
module Controller (
    input   logic        clk,rst_n,
    input   logic [1:0]  operation_select,
    output  logic        RD_en1,RD_en2, WR_en1,
    output  logic        mux1,mux2,
    output  logic        arith_op
);

//================================================== //
//      Defining the operation states                //
//================================================== //
localparam  RST_STATE        = 0,
            RD_MEM_CMD_STATE = 1,
            WR_MEM_CMD_STATE = 2,
            ADD_CMD1_STATE   = 3,
            ADD_CMD2_STATE   = 4,
            SUB_CMD1_STATE   = 5,
            SUB_CMD2_STATE   = 6;

logic [2:0]  current_state, next_state;


//================================================== //
//      storing current state always block           //
//================================================== //
always_ff @( posedge clk, negedge rst_n ) begin
    if(!rst_n)begin
        current_state <= RST_STATE;
    end
    else begin
        current_state <= next_state;
    end
end

//============================================================= //
//      checking input conditions to determine states           //
//============================================================= //
always_comb begin
    RD_en1      = 1'b0;
    RD_en2      = 1'b0;
    WR_en1      = 1'b0;
    mux1        = 1'b0;
    mux2        = 1'b0;
    arith_op    = 1'b0;
    next_state  = RST_STATE;

    case (current_state)
    //==========reset state===============//
        RST_STATE: begin
            RD_en1      = 1'b0;
            RD_en2      = 1'b0;
            WR_en1      = 1'b0;
            mux1        = 1'b0;
            mux2        = 1'b0;
            arith_op    = 1'b0;
                 if(operation_select == 2'b00) next_state = RD_MEM_CMD_STATE;
            else if(operation_select == 2'b01) next_state = WR_MEM_CMD_STATE;
            else if(operation_select == 2'b10) next_state = ADD_CMD1_STATE;
            else if(operation_select == 2'b11) next_state = SUB_CMD1_STATE;
        end
    //==========read memory command state===============//
        RD_MEM_CMD_STATE: begin
            mux1        = 1'b0;
            mux2        = 1'b0;
            RD_en1      = 1'b1;
            RD_en2      = 1'b0;
            WR_en1      = 1'b0;
            arith_op    = 1'b0;
                 if(operation_select == 2'b00) next_state = RD_MEM_CMD_STATE;
            else if(operation_select == 2'b01) next_state = WR_MEM_CMD_STATE;
            else if(operation_select == 2'b10) next_state = ADD_CMD1_STATE;
            else if(operation_select == 2'b11) next_state = SUB_CMD1_STATE;
        end
    //==========Write memory command state===============//
        WR_MEM_CMD_STATE: begin
            mux1        = 1'b1;
            mux2        = 1'b0;
            RD_en1      = 1'b0;
            RD_en2      = 1'b0;
            WR_en1      = 1'b1;
            arith_op    = 1'b0;
                 if(operation_select == 2'b00) next_state = RD_MEM_CMD_STATE;
            else if(operation_select == 2'b01) next_state = WR_MEM_CMD_STATE;
            else if(operation_select == 2'b10) next_state = ADD_CMD1_STATE;
            else if(operation_select == 2'b11) next_state = SUB_CMD1_STATE;
        end
    //==========ADD memory command read-cycle state===============//
        ADD_CMD1_STATE: begin
            mux1        = 1'b0;
            mux2        = 1'b1;
            RD_en1      = 1'b1;
            RD_en2      = 1'b1;
            WR_en1      = 1'b0;
            arith_op    = 1'b0;
            next_state  = ADD_CMD2_STATE;
        end
    //==========ADD memory command write-cycle state===============//
        ADD_CMD2_STATE: begin
            mux1        = 1'b1;
            mux2        = 1'b1;
            RD_en1      = 1'b0;
            RD_en2      = 1'b0;
            WR_en1      = 1'b1;
            arith_op    = 1'b0;
            /*     if(operation_select == 2'b00) next_state = RD_MEM_CMD_STATE;
            else if(operation_select == 2'b01) next_state = WR_MEM_CMD_STATE;
            else if(operation_select == 2'b10) next_state = ADD_CMD1_STATE;
            else if(operation_select == 2'b11) next_state = SUB_CMD1_STATE;*/
            next_state = RST_STATE;
        end
    //==========SUB memory command read-cycle state===============//
        SUB_CMD1_STATE: begin
            mux1        = 1'b0;
            mux2        = 1'b1;
            RD_en1      = 1'b1;
            RD_en2      = 1'b1;
            WR_en1      = 1'b0;
            arith_op    = 1'b1;
            next_state  = SUB_CMD2_STATE;
        end
    //==========SUB memory command write-cycle state===============//
        SUB_CMD2_STATE: begin
            mux1        = 1'b1;
            mux2        = 1'b1;
            RD_en1      = 1'b0;
            RD_en2      = 1'b0;
            WR_en1      = 1'b1;
            arith_op    = 1'b1;
            /*     if(operation_select == 2'b00) next_state = RD_MEM_CMD_STATE;
            else if(operation_select == 2'b01) next_state = WR_MEM_CMD_STATE;
            else if(operation_select == 2'b10) next_state = ADD_CMD1_STATE;
            else if(operation_select == 2'b11) next_state = SUB_CMD1_STATE;*/
            next_state = RST_STATE;
        end
    //==========Default state===============//
        default: begin
            RD_en1      = 1'b0;
            RD_en2      = 1'b0;
            WR_en1      = 1'b0;
            mux1        = 1'b0;
            mux2        = 1'b0;
            arith_op    = 1'b0;
                 if(operation_select == 2'b00) next_state = RD_MEM_CMD_STATE;
            else if(operation_select == 2'b01) next_state = WR_MEM_CMD_STATE;
            else if(operation_select == 2'b10) next_state = ADD_CMD1_STATE;
            else if(operation_select == 2'b11) next_state = SUB_CMD1_STATE;
        end 
    endcase
end

endmodule