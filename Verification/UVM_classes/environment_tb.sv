class environment_tb extends uvm_env;
        `uvm_component_utils(environment_tb)
        //------------virtual interface instance---------//
        virtual CS_interface config_intf_env;

        //--------- agent, scoreboard and subscriber instances in environment----------//
        agent_tb agent_in_env;
        scoreboard_tb scoreboard_in_env;
        subscriber_tb subscriber_in_env;

        function new(string name = "environment_tb", uvm_component parent = null);
            super.new(name,parent);
        endfunction //new()

        function void build_phase (uvm_phase phase);
            super.build_phase(phase);

            //-----creating handle for beneath components----------//
            agent_in_env = agent_tb::type_id::create("agent_in_env",this);
            scoreboard_in_env = scoreboard_tb::type_id::create("scoreboard_in_env",this);
            subscriber_in_env = subscriber_tb::type_id::create("subscriber_in_env",this);

            //---------connecting the virtual interface to the agent---------//
            if(!uvm_config_db #(virtual CS_interface)::get(this,"", "intf_virtual",config_intf_env))
                `uvm_fatal(get_full_name(),"Error in environment configuration!")
            uvm_config_db #(virtual CS_interface)::set(this,"agent_in_env","intf_virtual",config_intf_env);

            $display("build phase of environment is done!");
        endfunction

        function void connect_phase (uvm_phase phase);
            super.connect_phase(phase);
            agent_in_env.analysis_port_agent.connect(scoreboard_in_env.analysis_export_scoreboard);
            agent_in_env.analysis_port_agent.connect(subscriber_in_env.analysis_export);
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
    endclass //environment_tb extends uvm_environment