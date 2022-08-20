class tx_sequence extends uvm_sequence #(tx_item);
    `uvm_component_utils(tx_sequence);
    function new(string name = "tx_sequence");
        super.new(name);
    endfunction

    virtual task body();
        tx_item tx;
        repeat (5)begin
            tx = tx_item::type_id::create("tx"); // factory creation
            start_item(tx);                      //wait for driver to be ready 
            if (!tx.randomize()) begin
                `uvm_error("MY_SEQUENCE", "Randomize failed.");
              end
            finish_item(tx);
        end
    endtask:body
endclass:tx_sequence