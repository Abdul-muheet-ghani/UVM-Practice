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

class sequencer extends uvm_sequence #(sequence_item);
    `uvm_object_utils(sequencer)

    function new(string name = "sequence_item");
        super.new(name);
    endfunction
	sequence_item seq0;
    virtual task body();
      sequence_item seq0;
        seq0 = sequence_item::type_id::create("seq0");
        start_item(seq0);
      finish_item(seq0);
    endtask
endclass

//=================================================================

class uvm_agnt extends uvm_agent;
    `uvm_component_utils(uvm_agnt)

    function new(string name, uvm_component parent);
        super.new(name,parent);
    endfunction

  uvm_sequencer#(sequence_item) sqr;
    driver_seq drv;

    function void build_phase(uvm_phase phase);
        sqr = uvm_sequencer#(sequence_item)::type_id::create("sqr",this);//create the object of sequencer
        drv = driver_seq::type_id::create("drv",this);
    endfunction

    function void connect_phase(uvm_phase phase);
        drv.seq_item_port.connect(sqr.seq_item_export);                //TLM connection driver to parent of uvm_sequencer
    endfunction

    task run_phase (uvm_phase phase);
      phase.raise_objection(this);
      begin
        sequencer sq;                                                  //sequencer instance
        sq = sequencer::type_id::create("sq");                         //create copy and clone
        sq.start(sqr);                                                 //start the phases like, create, w8 for grant, randomize and other
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
      run_test("uvm_agnt");                                             //class agent run
      $display("end");
    end
endmodule