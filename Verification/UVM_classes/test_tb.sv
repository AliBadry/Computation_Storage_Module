class test_tb extends uvm_test;
        `uvm_component_utils(test_tb)
        //----------virtual interface instance----------//
        virtual CS_interface config_intf_test;
        //---------environment instance in test class-----//
        environment_tb env_in_test;

        //----------sequence instance in test class----------//
        sequence_tb sequence_in_test;

        function new(string name= "test_tb", uvm_component parent = null);
            super.new(name, parent);
        endfunction //new()

        function void build_phase (uvm_phase phase);
            super.build_phase(phase);

            env_in_test = environment_tb::type_id::create("env_in_test",this); // handle creation of env
            sequence_in_test = sequence_tb::type_id::create("sequence_in_test");

            if(!uvm_config_db #(virtual CS_interface)::get(this,"", "intf_virtual",config_intf_test))
                `uvm_fatal(get_full_name(),"Error in test configuration!")
            uvm_config_db #(virtual CS_interface)::set(this,"env_in_test","intf_virtual",config_intf_test);

            $display("build phase of test is done!");
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
            phase.raise_objection(this);
            sequence_in_test.start(env_in_test.agent_in_env.sequencer_in_agent);
            phase.drop_objection(this);
            $display("run phase of test is done!");
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
    endclass //test_tb extends uvm_test