class sequence_item extends uvm_sequence_item;
    //Sequence item 
    rand bit [7:0]a;

    //utility and field macros
    `uvm_object_utils_begin(sequence_item)
        `uvm_field_int(a,UVM_ALL_ON)
    `uvm_object_utils_end

    //Constructor
    function new(string name= "sequence_item");
        super.new(name);
    endfunction 

    constraint data_a {a>0;};
endclass

//===========================================================================

class driver_seq extends uvm_driver #(sequence_item);
    `uvm_component_utils(driver_seq)
    function new(string name ,uvm_component parent);
        super.new(name,parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
       // super.new(phase);
    endfunction

    task run_phase (uvm_phase phase);
        sequence_item itm;
        seq_item_port.get_next_item(itm);
        transfer(itm);
        seq_item_port.item_done();
    endtask

    virtual task transfer(sequence_item item);
        item.randomize();
        item.print();
    endtask
endclass

//===============================================================

class sequence_class extends uvm_sequence #(sequence_item);
    `uvm_object_utils(sequence_class)

    function new(string name = "sequence_item");
        super.new(name);
    endfunction
	sequence_item seq0;
    virtual task body();
        seq0 = sequence_item::type_id::create("seq0");
        start_item(seq0);
        finish_item(seq0);
      $display("end=========================================0");
      seq0 = sequence_item::type_id::create("seq0");
      $display("end=========================================1");
        start_item(seq0);
      $display("end=========================================2");
      finish_item(seq0);
    endtask
endclass

//=================================================================

class uvm_agnt extends uvm_agent;
    `uvm_component_utils(uvm_agnt)

    function new(string name, uvm_component parent);
        super.new(name,parent);
    endfunction

  uvm_sequencer#(sequence_item) sequencer_h;
    driver_seq drv;

    function void build_phase(uvm_phase phase);
        sequencer_h = uvm_sequencer#(sequence_item)::type_id::create("sequencer_h",this);//create the object of sequencer
        drv = driver_seq::type_id::create("drv",this);
    endfunction

    function void connect_phase(uvm_phase phase);
        drv.seq_item_port.connect(sequencer_h.seq_item_export);           //TLM connection driver to parent of uvm_sequencer
    endfunction

    task run_phase (uvm_phase phase);
      phase.raise_objection(this);
      begin
        sequence_class sequence_h;                                        //sequence instance
        sequence_h = sequence_class::type_id::create("sequence_h");       //create copy and clone
        sequence_h.start(sequencer_h);                                    //start the phases like, create, w8 for grant, randomize and other
      end
      phase.drop_objection(this);
    endtask
endclass

//=================================================================

module test;
    //Instance
    //uvm_agnt agnt;
    initial begin
      $display("end=================");
      run_test("uvm_agnt");                                               //class agent run
      $display("end");
    end
endmodule