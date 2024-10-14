class sequence_item_tb extends uvm_sequence_item;
        `uvm_object_utils(sequence_item_tb)
        function new(string name = "sequence_item_tb");
            super.new(name);
        endfunction //new()

        //---------defining the parameters of the CS_module----------//
        rand    logic   [3:0]       addA, addB, addC;
        rand    logic   [1:0]       operation_select;
        rand    logic   [7:0]       DQ_in;
        logic           [7:0]       DQ_out;
        logic           [7:0]       intf_ram    [0:15];
        logic                       rst_n;
        logic                       RD_en1,RD_en2,WR_en1;
        logic                       seq_finished; // to determine start and end of sequence for monitor capturing

        function void printf (string s_name);
            $display("The shown parameters are in %s",s_name);
        endfunction

        //---------defining constraints for randomized inputs when finishing the verification env.---------//
        constraint constr1{ addA inside {[0:15]};
                            addB inside {[0:15]};
                            addC inside {[0:15]};
                            unique {addA,addB,addC};}
    endclass //sequence_item_tb extends uvm_sequence_item