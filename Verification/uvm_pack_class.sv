// File : uvm_pack_class
// Author : Ali Badry
// Date : 27/9/2024
// Version : 1
// Abstract : this is UVM defined package for class extensions
package uvm_pack_class;
    import uvm_pkg::*;
    `include "uvm_macros.svh"

    `include "UVM_classes/sequence_item_tb.sv"

    `include "UVM_classes/sequencer_tb.sv"

    `include "UVM_classes/driver_tb.sv"

    `include "UVM_classes/monitor_tb.sv"

    `include "UVM_classes/agent_tb.sv"

    `include "UVM_classes/scoreboard_tb.sv"

    `include "UVM_classes/subscriber_tb.sv"
    
    `include "UVM_classes/environment_tb.sv"
    
    `include "UVM_classes/sequence_tb.sv"

    `include "UVM_classes/test_tb.sv"
    
endpackage