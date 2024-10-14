class monitor_tb extends uvm_monitor ;
        `uvm_component_utils(monitor_tb)

        //sequence_item_tb seq_item_in_monitor;
        //----------virtual interface instance--------//
        virtual CS_interface config_intf_monitor;

        //-----------analysis port instantiation-----------//
        uvm_analysis_port #(sequence_item_tb) analysis_port_monitor;

        //--------sequence item instance in monitor----------//
        sequence_item_tb seq_item_in_monitor;

        function new(string name = "monitor_tb", uvm_component parent = null);
            super.new(name,parent);
        endfunction //new()

        function void build_phase (uvm_phase phase);
            super.build_phase(phase);
            if(!uvm_config_db #(virtual CS_interface)::get(this,"", "intf_virtual",config_intf_monitor))
                `uvm_fatal(get_full_name(),"Error in monitor configuration!")

            analysis_port_monitor = new("analysis_port_monitor", this); // creation of analysis port
            
            seq_item_in_monitor = sequence_item_tb::type_id::create("seq_item_in_monitor");
            $display("build phase of monitor is done!");
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
            forever begin
                @(posedge config_intf_monitor.seq_finished)
                //@(posedge config_intf_monitor.clk) // if there is fault in reading, uncomment this
                if(config_intf_monitor.operation_select==2'b00) seq_item_in_monitor.DQ_out = config_intf_monitor.DQ_out;
                if(config_intf_monitor.operation_select==2'b01) seq_item_in_monitor.DQ_in = config_intf_monitor.DQ_in;
                seq_item_in_monitor.intf_ram = config_intf_monitor.intf_ram;
                seq_item_in_monitor.addA = config_intf_monitor.addA;
                seq_item_in_monitor.addB = config_intf_monitor.addB;
                seq_item_in_monitor.addC = config_intf_monitor.addC;
                seq_item_in_monitor.operation_select = config_intf_monitor.operation_select;
                analysis_port_monitor.write(seq_item_in_monitor);
            end
            $display("run phase in monitor is done!");
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
    endclass //monitor_tb extends uvm_monitor 