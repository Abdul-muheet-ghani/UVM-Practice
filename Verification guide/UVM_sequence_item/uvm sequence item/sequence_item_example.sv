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

module test;
    //Instance
    sequence_item seq;
    initial begin
        //create method 
        //Allocate a new object of same type and return base class handle
        seq = sequence_item::type_id::create();

        //randomize
      for (int i=0; i<=9; i++) begin
        seq.randomize();

        //print seq item
        seq.print();
    end
    end
endmodule