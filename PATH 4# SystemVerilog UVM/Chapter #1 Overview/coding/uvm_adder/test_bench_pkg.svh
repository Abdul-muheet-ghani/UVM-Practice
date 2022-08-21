


package test_bench_pkg;
    `include uvm_pkg::*;
        `include "sequencer.svh"
        `include "driver.svh"
    
        class tx_agent extends uvm_agent;
          `uvm_component_utils(tx_agent)
          function new(string name, uvm_component parent);
            super.new(name,parent);  
          endfunction
          
          tx_deriver drv;
          uvm_sequencer #(tx_sequence) sqr;
          
          function void build_phase(uvm_phase phase);
            drv = tx_driver::type_id::create("drv",this);
            sqr = uvm_sequencer#(tx_sequence)::type_id::create("sqr",this);
          endfunction
          
          function void connect_phase(uvm_phase phase);
            drv.seq_item_port.connect(sqr.seq_item_export);
          endfunction
          
          task run_phase (uvm_phase phase);
            phase.raise_objection(this);
            begin
              tx_sequencer seq;
              seq = tx_sequencer::type_id::create("seq",this);
              seq.start(sqr);
            end
            phase.raise_objection(this);
          endtask
        endclass
    
        class tx_env extends uvm_env;
          `uvm_component_utils(tx_env);
          function new(string name, uvm_component parent);
            super.new(this);
          endfunction
          tx_agent agnt;
          
          function build_phase(uvm_phase phase);
            agnt = tx_agent::type_id::create("agnt",this);
          endfunction
        endclass
    
        class tx_test extends uvm_test;
          `uvm_component_utils(tx_test)
          function new(string name, uvm_component parent);
            super.new(name, parent);
          endfunction 
          
          tx_env env;
          function build_phase(uvm_phase phase);
            env = tx_env::type_id::create("env",this);
          endfunction 
          
          task run_phase(uvm_phase phase);
            phase.raise_objection(this);
            #10;
             `uvm_warning("", "Hello World!")
            phase.drop_objection(this);
          endtask
        endclass
    endpackage