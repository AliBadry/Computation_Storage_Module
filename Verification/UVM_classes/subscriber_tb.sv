class subscriber_tb extends uvm_subscriber #(sequence_item_tb);
        `uvm_component_utils(subscriber_tb)
        sequence_item_tb seq_item_in_subscriber;
        //---------covergroup definition--------------//
        covergroup coverage_subscriber; //could use sensitivity list to sample at every posedge of clock
            cover1: coverpoint seq_item_in_subscriber.addA {bins bin1[] = {[0:15]};}
            cover2: coverpoint seq_item_in_subscriber.addB {bins bin2[] = {[0:15]};}
            cover3: coverpoint seq_item_in_subscriber.addC {bins bin3[] = {[0:15]};}
            cover4: coverpoint seq_item_in_subscriber.DQ_in {bins bin4[] = {8'hff,8'h00};}
            cover5: coverpoint seq_item_in_subscriber.operation_select {
                    bins bin4[] = (0,1,2,3 => 0,1,2,3);}
            cross cover1,cover2;
            cross cover1,cover3;
            cross cover3,cover2;
        endgroup
        function new(string name = "subscriber_tb", uvm_component parent = null);
            super.new(name,parent);
            coverage_subscriber = new();
        endfunction //new()

        function void build_phase (uvm_phase phase);
            super.build_phase(phase);
            seq_item_in_subscriber = sequence_item_tb::type_id::create("seq_item_in_subscriber");
        endfunction

        function void connect_phase (uvm_phase phase);
            super.connect_phase(phase);
        endfunction

        function void end_of_elaboration_phase(uvm_phase phase);
            super.end_of_elaboration_phase(phase);
        endfunction

        function void start_of_simulation_phase (uvm_phase phase);
            super.start_of_simulation_phase(phase);
        endfunction

        task run_phase (uvm_phase phase);
            super.run_phase(phase);
        endtask

        function void extract_phase(uvm_phase phase);
            super.extract_phase(phase);
        endfunction

        function void check_phase(uvm_phase phase);
            super.check_phase(phase);
        endfunction

        function void report_phase(uvm_phase phase);
            super.report_phase(phase);
        endfunction

        function void final_phase(uvm_phase phase);
            super.final_phase(phase);
        endfunction

        function void write (sequence_item_tb t);
            //t.printf("subscriber");
            coverage_subscriber.sample();
            seq_item_in_subscriber = t;
        endfunction
    endclass //subscriber_tb extends uvm_subscriber
