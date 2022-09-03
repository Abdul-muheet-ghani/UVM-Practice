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

        //randomize
      for (int i=0; i<=2; i++) begin
        seq0.randomize();

        //print seq item
        seq0.print();

        $cast(seq1,seq0.clone());//Create seq1 and copy seq0 to seq1
        //we wil change seq1 by randomizing

        //print seq item
        seq1.print();
        seq1.randomize();
        seq1.print(); // now seq1 randomize and change
                              //-----------------------------------------
                              //Name           Type           Size  Value
                              //-----------------------------------------
                              //sequence_item  sequence_item  -     @334 
                              //  a            integral       8     'h56 
                              //-----------------------------------------
                              //-----------------------------------------
                              //Name           Type           Size  Value
                              //-----------------------------------------
                              //sequence_item  sequence_item  -     @338 
                              //  a            integral       8     'h7a 
                              //-----------------------------------------
                              //UVM_INFO /apps/vcsmx/vcs/S-2021.09//etc/uvm-1.2/src/base/uvm_comparer.svh(351) @ 0: reporter [MISCMP] Miscompare for sequence_item.a: lhs = 'h56 : rhs = 'h7a
                              //UVM_INFO /apps/vcsmx/vcs/S-2021.09//etc/uvm-1.2/src/base/uvm_comparer.svh(382) @ 0: reporter [MISCMP] 1 Miscompare(s) for object sequence_item@338 vs. sequence_item@334
                              //UVM_ERROR testbench.sv(39) @ 0: reporter [] seq_item_0 is not matching with seq_item_1
                              //-----------------------------------------
                              //Name           Type           Size  Value
                              //-----------------------------------------
                              //sequence_item  sequence_item  -     @334 
                              //  a            integral       8     'h56 
                              //-----------------------------------------
                              //-----------------------------------------
                              //Name           Type           Size  Value
                              //-----------------------------------------
                              //sequence_item  sequence_item  -     @338 
                              //  a            integral       8     'h56 
                              //-----------------------------------------
                              //UVM_INFO testbench.sv(46) @ 0: reporter [] seq_item_0 matching with seq_item_1

    end
    end
endmodule