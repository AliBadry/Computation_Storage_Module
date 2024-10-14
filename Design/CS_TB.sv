// File : CS_TB
// Author : Ali Badry
// Date : 26/9/2024
// Version : 1
// Abstract : Direct stimulus testbench to make sure the design's main functionality works
//            as intended (other cases may be found in UVM testbench)
`timescale 1ns/1ps
module CS_TB ();


//==================================================//
//      CLK, RST and internal signal definition     //
//==================================================//
logic       clk_tb, rst_n_tb;
wire  [7:0] DQ_tb;
logic [7:0] DQ_tb1;

//==========================================//
//          Interface instantiation         //
//==========================================//
CS_interface #(.MEM_WIDTH(8), .MEM_DEPTH(16), .NO_OPERATIONS(4)) CS_I1 (.clk(clk_tb), .rst_n(rst_n_tb), .DQ(DQ_tb));

//=====================================================//
//          Assigning interface driven signals         //
//==================================================== //
assign DQ_tb = CS_TOP1.U_CS1.DQ_out_enable?'bz:DQ_tb1;
assign CS_I1.RD_en1 = 1'bz;
assign CS_I1.RD_en2 = 1'bz;
assign CS_I1.WR_en1 = 1'bz;
//==========================================//
//          Wrapper instantiation           //
//==========================================//
CS_wrapper #(.MEM_WIDTH(8), .MEM_DEPTH(16), .NO_OPERATIONS(4) ) CS_TOP1 (CS_I1);

//==========================================//
//              Clock toggling              //
//==========================================//
initial begin
    clk_tb = 1'b0;
    forever begin
        #5 clk_tb = ~clk_tb;
    end
end

//==========================================//
//              system reset                //
//==========================================//

initial begin
    $readmemh("MEM_content.txt",CS_TOP1.U_CS1.RAM1.RAM);
    rst_n_tb = 1'b0;
    #10 rst_n_tb = 1'b1;
end

//==========================================//
//          applying test cases             //
//==========================================//

// each operation takes 2 clk cycles to maintain the read-write operation in CMDs 3 & 4 (SUB - ADD).
initial begin
    change_ip_with_DQ ('h0,'h0,'h0,'h0,'h0);
    // monitor the changes in the input and the output
    $monitor("at time %t,  address A: %h, address B: %h, address C: %h, operation select: %h, DQ: %h", $time, CS_I1.addA, CS_I1.addB, CS_I1.addC, CS_I1.operation_select, CS_I1.DQ);

    #10
    // RD_CMD_MEM test
    @(negedge clk_tb)
    change_ip_without_DQ ('h8,'h0,'h0,'h0);
    @(posedge clk_tb) #1 @(posedge clk_tb) #1
    if(CS_TOP1.DQ != CS_TOP1.U_CS1.RAM1.RAM[8]) begin
        $display("Error in RD_CMD_MEM (test1)!");
        $stop;
    end
    else $display("RD_CMD_MEM (test1) passed successfully!");

    // WR_CMD_MEM test
    @(negedge clk_tb)
    change_ip_with_DQ ('h8,'h0,'h1,'h1,'hff);
    @(posedge clk_tb) #1 @(posedge clk_tb) #1
    if(CS_TOP1.U_CS1.RAM1.RAM[1] != 'hff) begin
        $display("Error in WR_CMD_MEM (test2)!");
        $stop;
    end
    else $display("WR_CMD_MEM (test2) passed successfully!");

    // ADD_CMD test
    @(negedge clk_tb)
    change_ip_without_DQ ('ha,'h5,'hd,'h2);
    @(posedge clk_tb) #1 @(posedge clk_tb) #1 @(posedge clk_tb) #1
    if(CS_TOP1.U_CS1.RAM1.RAM[13] != CS_TOP1.U_CS1.RAM1.RAM[10] + CS_TOP1.U_CS1.RAM1.RAM[5]) begin
        $display("Error in ADD_CMD (test3)!");
        $stop;
    end
    else $display("ADD_CMD (test3) passed successfully!");

    // SUB_CMD test
    @(negedge clk_tb)
    change_ip_without_DQ ('hc,'h3,'h7,'h3);
    @(posedge clk_tb) #1 @(posedge clk_tb) #1 @(posedge clk_tb) #1
    if(CS_TOP1.U_CS1.RAM1.RAM[7] != CS_TOP1.U_CS1.RAM1.RAM[12] - CS_TOP1.U_CS1.RAM1.RAM[3]) begin
        $display("Error in SUB_CMD (test4)!");
        $stop;
    end
    else $display("SUB_CMD (test4) passed successfully!");

    #50 $finish;
end

//==========================================//
//          Driving inputs tasks            //
//==========================================//
task  change_ip_without_DQ(
    input logic [$clog2(16)-1:0]    addressA,
    input logic [$clog2(16)-1:0]    addressB,
    input logic [$clog2(16)-1:0]    addressC,
    input logic [1:0]               OP_sel
);
CS_I1.addA              = addressA;
CS_I1.addB              = addressB;
CS_I1.addC              = addressC;
CS_I1.operation_select  = OP_sel; 
endtask

task  change_ip_with_DQ(
    input logic [$clog2(16)-1:0]    addressA,
    input logic [$clog2(16)-1:0]    addressB,
    input logic [$clog2(16)-1:0]    addressC,
    input logic [1:0]               OP_sel,
    input logic [7:0]               dq
);
CS_I1.addA              = addressA;
CS_I1.addB              = addressB;
CS_I1.addC              = addressC;
CS_I1.operation_select  = OP_sel; 
DQ_tb1                  = dq;
endtask

endmodule