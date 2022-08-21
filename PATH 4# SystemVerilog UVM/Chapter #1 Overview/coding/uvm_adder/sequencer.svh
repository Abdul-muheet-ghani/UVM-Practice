class tx_sequence extends uvm_sequence_item;
    `uvm_object_utils(tx_sequence)
    
    rand int data_a;
    rand int data_b;
    constraint c_data_a {data_a>=0; data_a<=255;}
    constraint c_data_b {data_b>=0; data_b<=255;}
    
    function new(string name ="tx_sequence");
      super.new(name);
    endfunction
  endclass
  
  
  class tx_sequencer extends uvm_sequence;
    `uvm_component_utils(tx_sequencer)
    function new(string name, uvm_component parent);
      super.new(name,parent);
    endfunction
        
    virtual task body
      repeat (8)begin
        req = tx_sequence::type_id::create("req");
        start_item(req);
        if(!req.randomize)begin
          `uvm_error("tx_sequence","failed radomization);
        end
        finish_item(req);
      end
    endtask
  endclass
  
  
  