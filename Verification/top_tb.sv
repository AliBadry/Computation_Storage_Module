// File : top_tb
// Author : Ali Badry
// Date : 27/9/2024
// Version : 1
// Abstract : UVM testbench
//`timescale 1ns/1ps
module top_tb ();
//==========================================//
//          Importing uvm packs             //
//==========================================//
import uvm_pkg::*;
import uvm_pack_class::*;

//==================================================//
//      CLK, RST and internal signal definition     //
//==================================================//
logic       clk_tb;

//==========================================//
//          Interface instantiation         //
//==========================================//

CS_interface #(.MEM_WIDTH(8), .MEM_DEPTH(16), .NO_OPERATIONS(4)) CS_I1 (.clk(clk_tb));

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

//=================================================//
//   initializing memory with preloaded values     //
//=================================================//

initial begin
    $readmemh("MEM_content.txt",CS_TOP1.U_CS1.RAM1.RAM);
end


//==========================================================//
//          Initiating verification environment             //
//==========================================================//
    initial begin
        uvm_config_db #(virtual CS_interface):: set(null,"uvm_test_top","intf_virtual",CS_I1);
        run_test("test_tb");
    end

    
endmodule