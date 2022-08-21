class tx_driver extends uvm_driver #(tx_item);
    `uvm_component_utils(tx_driver)

    funcnction new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual task run_phase(uvm_phase phase);
        tx_item tx;
        forever begin
            seq_item_port.get_next_item(tx);
            transfer(tx);
            seq_item_port.item_done();
        end
    endtask

    virtual task transfer(tx_item tr);
        `uvm_info("TRANSACTION", $sformatf("transaction = %3d",tr.addr ), UVM_LOW);
    endtask


endclass