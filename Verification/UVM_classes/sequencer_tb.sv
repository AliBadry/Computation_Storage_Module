class sequencer_tb extends uvm_sequencer #(sequence_item_tb,sequence_item_tb);
        `uvm_component_utils(sequencer_tb)
        function new(string name = "sequencer_tb", uvm_component parent = null);
            super.new(name,parent);
        endfunction //new()

        function void build_phase (uvm_phase phase);
            super.build_phase(phase);
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
    endclass //sequencer_tb extends uvm_sequencer