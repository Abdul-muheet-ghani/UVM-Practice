

class my_transaction extends uvm_sequence_item;

    `uvm_object_utils(my_transaction)
  
    rand bit cmd;
    rand int addr;
    rand int data;
  
    constraint c_addr { addr >= 0; addr < 256; }
    constraint c_data { data >= 0; data < 256; }
  
    function new (string name = "");
      super.new(name);
    endfunction
  
  endclass: my_transaction
  
  
  //===========================================================================
  
  class my_driver extends uvm_driver #(my_transaction);
  
    `uvm_component_utils(my_driver)
  
    //virtual dut_if dut_vif;
  
    function new(string name, uvm_component parent);
      super.new(name, parent);
    endfunction
  
    function void build_phase(uvm_phase phase);

    endfunction 
  
    task run_phase(uvm_phase phase);
      forever begin
        seq_item_port.get_next_item(req);
        transfer(req);
        seq_item_port.item_done();
      end
    endtask
     virtual task transfer(my_transaction item);
          item.randomize();
          item.print();
      endtask
  
  endclass: my_driver
  
  //==============================================================================
  
  class my_sequence extends uvm_sequence#(my_transaction);
  
    `uvm_object_utils(my_sequence)
  
    function new (string name = "");
      super.new(name);
    endfunction
  
    task body;
      repeat(8) begin
        req = my_transaction::type_id::create("req");
        start_item(req);
        finish_item(req);
      end
    endtask: body
  
  endclass: my_sequence
  
  //================================================================================
    
    class my_agent extends uvm_agent;
      `uvm_component_utils(my_agent)
      
      my_driver driver;
      uvm_sequencer#(my_transaction) sequencer;
      
      function new(string name, uvm_component parent);
        super.new(name, parent);
      endfunction
      
      function void build_phase(uvm_phase phase);
        driver = my_driver ::type_id::create("driver", this);
        sequencer =
          uvm_sequencer#(my_transaction)::type_id::create("sequencer", this);
      endfunction    
      
      function void connect_phase(uvm_phase phase);
        driver.seq_item_port.connect(sequencer.seq_item_export);
      endfunction
      
      task run_phase(uvm_phase phase);
        phase.raise_objection(this);
        begin
          my_sequence seq;
          seq = my_sequence::type_id::create("seq");
          seq.start(sequencer);
        end
        phase.drop_objection(this);
      endtask
    endclass
  
  //=================================================================================
  
  module top;
    initial begin
      run_test("my_agent");
    end
    
  endmodule
  