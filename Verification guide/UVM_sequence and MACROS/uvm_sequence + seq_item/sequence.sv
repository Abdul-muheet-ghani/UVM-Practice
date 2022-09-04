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

class sequencer extends uvm_sequence #(sequence_item);
    `uvm_object_utils(sequencer)

    function new(string name = "sequence_item");
        super.new(name);
    endfunction
	sequence_item seq0;
    virtual task body();
      sequence_item seq0;
        seq0 = sequence_item::type_id::create("seq0");
        seq0.randomize();
        seq0.print();
    endtask
endclass

module test;
    //Instance
    sequencer sequ;
    initial begin
      $display("end=================");
      sequ = sequencer::type_id::create();
      sequ.body();
      $display("end");
              //Name  Type           Size  Value
              //--------------------------------
              //seq0  sequence_item  -     @340 
              //  a   integral       8     'h7a 
              //--------------------------------
    end
endmodule