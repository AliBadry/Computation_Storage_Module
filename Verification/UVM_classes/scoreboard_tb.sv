class scoreboard_tb extends uvm_scoreboard;
        `uvm_component_utils(scoreboard_tb)

        sequence_item_tb seq_item_in_scoreboard;
        sequence_item_tb seq_item_expected; // this should be connected to reference model

        //logic [7:0] reference_mem [0:15]; //this reads from a reference output file
        int counter = 0;
        int error_count= 0;

        //------- ports instantiation----------//
        uvm_tlm_analysis_fifo #(sequence_item_tb) analysis_fifo_scoreboard;
        uvm_analysis_export #(sequence_item_tb) analysis_export_scoreboard;

        function new(string name = "scoreboard_tb", uvm_component parent = null);
            super.new(name,parent);
        endfunction //new()

        function void build_phase (uvm_phase phase);
            super.build_phase(phase);
            analysis_fifo_scoreboard = new("analysis_fifo_scoreboard",this);  //creation of analysis fifo
            analysis_export_scoreboard = new("analysis_export_scoreboard",this); // creating analysis export handle

            seq_item_in_scoreboard = sequence_item_tb::type_id::create("seq_item_in_scoreboard");
            seq_item_expected = sequence_item_tb::type_id::create("seq_item_expected");

            //$readmemh("reference_mem_file.txt",reference_mem);
            $display("build phase in scoreboard is done!");
        endfunction

        function void connect_phase (uvm_phase phase);
            super.connect_phase(phase);
            analysis_export_scoreboard.connect(analysis_fifo_scoreboard.analysis_export);

            $display("connect phase in scoreboard is done!");
        endfunction

        function void end_of_elaboration_phase(uvm_phase phase);
            super.end_of_elaboration_phase(phase);
        endfunction

        function void start_of_simulation_phase (uvm_phase phase);
            super.start_of_simulation_phase(phase);
        endfunction

        task run_phase (uvm_phase phase);
            super.run_phase(phase);
            forever begin
                analysis_fifo_scoreboard.get(seq_item_in_scoreboard);
                //perform the comparison here between the hardware output and reference output//
                if(seq_item_in_scoreboard.operation_select == 2'b00) begin
                    if(seq_item_in_scoreboard.DQ_out != seq_item_in_scoreboard.intf_ram[seq_item_in_scoreboard.addA]) begin
                        error_count++;
                        `uvm_error("run_phase",$sformatf("camparison faild in operation 0!"));
                    end
                end
                else if(seq_item_in_scoreboard.operation_select == 2'b01) begin
                    if(seq_item_in_scoreboard.DQ_in != seq_item_in_scoreboard.intf_ram[seq_item_in_scoreboard.addC]) begin
                        error_count++;
                        `uvm_error("run_phase",$sformatf("camparison faild in operation 1!"));
                    end
                end
                else if(seq_item_in_scoreboard.operation_select == 2'b10) begin
                    if(seq_item_in_scoreboard.intf_ram[seq_item_in_scoreboard.addC] != seq_item_in_scoreboard.intf_ram[seq_item_in_scoreboard.addA] + seq_item_in_scoreboard.intf_ram[seq_item_in_scoreboard.addB]) begin
                        error_count++;
                        `uvm_error("run_phase",$sformatf("camparison faild in operation 2!"));
                    end
                end
                else if(seq_item_in_scoreboard.operation_select == 2'b11) begin
                    if(seq_item_in_scoreboard.intf_ram[seq_item_in_scoreboard.addC] != seq_item_in_scoreboard.intf_ram[seq_item_in_scoreboard.addA] - seq_item_in_scoreboard.intf_ram[seq_item_in_scoreboard.addB]) begin
                        error_count++;
                        `uvm_error("run_phase",$sformatf("camparison faild in operation 3!"));
                    end
                end
                counter++;
            end
        endtask

        function void extract_phase(uvm_phase phase);
            super.extract_phase(phase);
        endfunction

        function void check_phase(uvm_phase phase);
            super.check_phase(phase);
        endfunction

        function void report_phase(uvm_phase phase);
            super.report_phase(phase);
            `uvm_info("report_phase",$sformatf("total errors occured: %d from total cases: %d",error_count,counter),UVM_MEDIUM);
        endfunction

        function void final_phase(uvm_phase phase);
            super.final_phase(phase);
        endfunction
    endclass //scoreboard_tb    extends superClass
