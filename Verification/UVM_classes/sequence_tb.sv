class sequence_tb extends uvm_sequence #(sequence_item_tb, sequence_item_tb);
        `uvm_object_utils(sequence_tb)
        //--------creating instance for sequence item--------//
        sequence_item_tb seq_item_in_sequence;

        function new(string name = "sequence_tb");
            super.new(name);
        endfunction //new()

        task pre_body;
            //-------creating handle for sequnce item---------//
            seq_item_in_sequence = sequence_item_tb::type_id::create("seq_item_in_sequence");
        endtask

        task body;
            //------initialize system by reset ---------//
            start_item(seq_item_in_sequence);
            //void'(seq_item_in_sequence.randomize());
            seq_item_in_sequence.rst_n <= 1'b0;
            finish_item(seq_item_in_sequence);

            //------initialize system by reset ---------//
            start_item(seq_item_in_sequence);
            //void'(seq_item_in_sequence.randomize());
            seq_item_in_sequence.rst_n <= 1'b1;
            finish_item(seq_item_in_sequence);

            //------first test case---------//
            start_item(seq_item_in_sequence);
            //void'(seq_item_in_sequence.randomize());
            seq_item_in_sequence.addA <= 4'd8;
            seq_item_in_sequence.addB <= 4'd0;
            seq_item_in_sequence.addC <= 4'd0;
            seq_item_in_sequence.operation_select <= 2'd0;
            finish_item(seq_item_in_sequence);

            //------second test case---------//
            start_item(seq_item_in_sequence);
            //void'(seq_item_in_sequence.randomize());
            seq_item_in_sequence.addA <= 4'd0;
            seq_item_in_sequence.addB <= 4'd0;
            seq_item_in_sequence.addC <= 4'd1;
            seq_item_in_sequence.operation_select <= 2'd1;
            seq_item_in_sequence.DQ_in <= 8'hff;
            finish_item(seq_item_in_sequence);

            //------third test case---------//
            start_item(seq_item_in_sequence);
            //void'(seq_item_in_sequence.randomize());
            seq_item_in_sequence.addA <= 4'd10;
            seq_item_in_sequence.addB <= 4'd5;
            seq_item_in_sequence.addC <= 4'd13;
            seq_item_in_sequence.operation_select <= 2'd2;
            finish_item(seq_item_in_sequence);

            //------fourth test case---------//
            start_item(seq_item_in_sequence);
            //void'(seq_item_in_sequence.randomize());
            seq_item_in_sequence.addA <= 4'd12;
            seq_item_in_sequence.addB <= 4'd3;
            seq_item_in_sequence.addC <= 4'd7;
            seq_item_in_sequence.operation_select <= 2'd3;
            finish_item(seq_item_in_sequence);

            //------intermediate system by reset ---------//
            start_item(seq_item_in_sequence);
            //void'(seq_item_in_sequence.randomize());
            seq_item_in_sequence.rst_n <= 1'b0;
            finish_item(seq_item_in_sequence);

            //------intermediate system by reset ---------//
            start_item(seq_item_in_sequence);
            //void'(seq_item_in_sequence.randomize());
            seq_item_in_sequence.rst_n <= 1'b1;
            finish_item(seq_item_in_sequence);

            //------fifth test part1 case---------//
            start_item(seq_item_in_sequence);
            //void'(seq_item_in_sequence.randomize());
            seq_item_in_sequence.addA <= 4'd4;
            seq_item_in_sequence.addB <= 4'd0;
            seq_item_in_sequence.addC <= 4'd11;
            seq_item_in_sequence.operation_select <= 2'd0;
            finish_item(seq_item_in_sequence);

            //------fifth test part2 case---------//
            start_item(seq_item_in_sequence);
            //void'(seq_item_in_sequence.randomize());
            seq_item_in_sequence.addA <= 4'd4;
            seq_item_in_sequence.addB <= 4'd0;
            seq_item_in_sequence.addC <= 4'd11;
            seq_item_in_sequence.operation_select <= 2'd2;
            finish_item(seq_item_in_sequence);

            //------sixth test part1 case---------//
            start_item(seq_item_in_sequence);
            //void'(seq_item_in_sequence.randomize());
            seq_item_in_sequence.addA <= 4'd6;
            seq_item_in_sequence.addB <= 4'd15;
            seq_item_in_sequence.addC <= 4'd2;
            seq_item_in_sequence.DQ_in <= 8'h00;
            seq_item_in_sequence.operation_select <= 2'd1;
            finish_item(seq_item_in_sequence);

            //------sixth test part2 case---------//
            start_item(seq_item_in_sequence);
            //void'(seq_item_in_sequence.randomize());
            seq_item_in_sequence.addA <= 4'd6;
            seq_item_in_sequence.addB <= 4'd15;
            seq_item_in_sequence.addC <= 4'd2;
            seq_item_in_sequence.operation_select <= 2'd3;
            finish_item(seq_item_in_sequence);

            //------seventh test part1 case---------//
            start_item(seq_item_in_sequence);
            //void'(seq_item_in_sequence.randomize());
            seq_item_in_sequence.addA <= 4'd1;
            seq_item_in_sequence.addB <= 4'd9;
            seq_item_in_sequence.addC <= 4'd9;
            seq_item_in_sequence.DQ_in <= 8'hff;
            seq_item_in_sequence.operation_select <= 2'd1;
            finish_item(seq_item_in_sequence);

            //------seventh test part2 case---------//
            start_item(seq_item_in_sequence);
            //void'(seq_item_in_sequence.randomize());
            seq_item_in_sequence.addA <= 4'd1;
            seq_item_in_sequence.addB <= 4'd9;
            seq_item_in_sequence.addC <= 4'd1;
            seq_item_in_sequence.DQ_in <= 8'hff;
            seq_item_in_sequence.operation_select <= 2'd1;
            finish_item(seq_item_in_sequence);

            //------seventh test part3 case---------//
            start_item(seq_item_in_sequence);
            //void'(seq_item_in_sequence.randomize());
            seq_item_in_sequence.addA <= 4'd1;
            seq_item_in_sequence.addB <= 4'd9;
            seq_item_in_sequence.addC <= 4'd12;
            seq_item_in_sequence.operation_select <= 2'd2;
            finish_item(seq_item_in_sequence);

            //---------eighth test case --------------//
            for (int i=0;i<1000;i++) begin
            start_item(seq_item_in_sequence);
            void'(seq_item_in_sequence.randomize());
            finish_item(seq_item_in_sequence);
            end
        endtask
    endclass //sequence_tb extends uvm_sequence