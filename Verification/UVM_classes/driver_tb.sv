class driver_tb extends uvm_driver #(sequence_item_tb,sequence_item_tb);
        `uvm_component_utils(driver_tb)

        //------virtual interface instance-----------//
        virtual CS_interface config_intf_driver;

        //-----sequence item instance-------//
        sequence_item_tb seq_item_in_driver;

        //---------output file generated ID----------//
        //int fileID1, fileID2, fileID3;

        function new(string name = "driver_tb", uvm_component parent = null);
            super.new(name,parent);
        endfunction //new()

        function void build_phase (uvm_phase phase);
            super.build_phase(phase);

            if(!uvm_config_db #(virtual CS_interface)::get(this,"", "intf_virtual",config_intf_driver))
                `uvm_fatal(get_full_name(),"Error in driver configuration!")

            seq_item_in_driver = sequence_item_tb::type_id::create("seq_item_in_driver");
            $display("build phase of driver is done!");
        endfunction

        function void connect_phase (uvm_phase phase);
            super.connect_phase(phase);
           // $display("connect phase in driver is done!");
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
                seq_item_port.get_next_item(seq_item_in_driver);
                //------running test cases where each test case should take 2 clk cycles after encountering first posedge clk-------//
                @(negedge config_intf_driver.clk)
                config_intf_driver.seq_finished <= 1'b0; //indicating start of sequence
                config_intf_driver.addA <= seq_item_in_driver.addA;
                config_intf_driver.addB <= seq_item_in_driver.addB;
                config_intf_driver.addC <= seq_item_in_driver.addC;
                config_intf_driver.rst_n <= seq_item_in_driver.rst_n;
                config_intf_driver.operation_select <= seq_item_in_driver.operation_select;
                if(seq_item_in_driver.operation_select==2'b01) config_intf_driver.DQ_in <= seq_item_in_driver.DQ_in;
                @(posedge config_intf_driver.clk)
                #1 @(posedge config_intf_driver.clk)
                #1 @(posedge config_intf_driver.clk)
                config_intf_driver.seq_finished <= 1'b1; //indicating end of sequence
                #1 seq_item_port.item_done();
            end

            $display("run phase in driver is done!");
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
    endclass //driver_tb extends uvm_driver #(sequence_item_tb,sequence_item_tb)