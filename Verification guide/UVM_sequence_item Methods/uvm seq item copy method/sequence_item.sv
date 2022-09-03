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
    sequence_item seq0;
    sequence_item seq1;
    initial begin
        //create method 
        //Allocate a new object of same type and return base class handle
        seq0 = sequence_item::type_id::create();
      	seq1 = sequence_item::type_id::create();

        //randomize
      for (int i=0; i<=2; i++) begin
        seq0.randomize();

        //print seq item
        seq0.print();

        seq1.randomize();

        //print seq item
        seq1.print();
        seq1.copy(seq0);
        seq1.print(); // now seq1 replace with seq0 bc seq0 copy to seq1

    end
    end
endmodule