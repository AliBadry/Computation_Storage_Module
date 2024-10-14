class agent_tb extends uvm_agent;
        `uvm_component_utils(agent_tb)

        //----------monitor, driver and sequencer instances--------//
        sequencer_tb sequencer_in_agent;
        monitor_tb monitor_in_agent;
        driver_tb driver_in_agent;

        //----------interface instance-------------//
        virtual CS_interface config_intf_agent;

        //----------analysis port instantiation--------//
        uvm_analysis_port #(sequence_item_tb) analysis_port_agent;

        function new(string name = "agent_tb", uvm_component parent = null);
            super.new(name,parent);
        endfunction //new()

        function void build_phase (uvm_phase phase);
            super.build_phase(phase);

            //---------creating handles for beneath components---------------//
            sequencer_in_agent = sequencer_tb::type_id::create("sequencer_in_agent",this);
            monitor_in_agent = monitor_tb::type_id::create("monitor_in_agent",this);
            driver_in_agent = driver_tb::type_id::create("driver_in_agent",this);

            //-----------connecting the interface to driver-------------//
            if(!uvm_config_db #(virtual CS_interface)::get(this,"", "intf_virtual",config_intf_agent))
                `uvm_fatal(get_full_name(),"Error in agent configuration!")
            uvm_config_db #(virtual CS_interface)::set(this,"driver_in_agent","intf_virtual",config_intf_agent);
            uvm_config_db #(virtual CS_interface)::set(this,"monitor_in_agent","intf_virtual",config_intf_agent);

            analysis_port_agent = new("analysis_port_agent",this);  // creating handle for analysis port
            $display("build phase in agent is done!");
        endfunction

        function void connect_phase (uvm_phase phase);
            super.connect_phase(phase);
            monitor_in_agent.analysis_port_monitor.connect(analysis_port_agent);
            driver_in_agent.seq_item_port.connect(sequencer_in_agent.seq_item_export);
            $display("connect phase of agent is done!");
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
    endclass //agent_tb extends uvm_agent