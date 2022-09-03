class my_transaction extends uvm_sequence_item;

  `uvm_object_utils(my_transaction)
  
    rand int data_a;
    rand int data_b;
    constraint c_data_a {data_a>=0; data_a<=255;}
    constraint c_data_b {data_b>=0; data_b<=255;}

  function new (string name = "");
    super.new(name);
  endfunction

endclass: my_transaction

class my_sequence extends uvm_sequence#(my_transaction);

  `uvm_object_utils(my_sequence)

  function new (string name = "");
    super.new(name);
  endfunction

  task body;
    repeat(8) begin
      req = my_transaction::type_id::create("req");
      start_item(req);

      if (!req.randomize()) begin
        `uvm_error("MY_SEQUENCE", "Randomize failed.");
      end

      // If using ModelSim, which does not support randomize(),
      // we must randomize item using traditional methods, like
      // req.cmd = $urandom;
      // req.addr = $urandom_range(0, 255);
      // req.data = $urandom_range(0, 255);

      finish_item(req);
    end
  endtask: body

endclass: my_sequence
