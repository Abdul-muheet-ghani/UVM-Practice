class my_driver extends uvm_driver #(my_transaction);

  `uvm_component_utils(my_driver)

  virtual dut_if dut_vif;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    // Get interface reference from config database
    if(!uvm_config_db#(virtual dut_if)::get(this, "", "dut_vif", dut_vif)) begin
      `uvm_error("", "uvm_config_db::get failed")
    end
  endfunction 

  task run_phase(uvm_phase phase);
    // First toggle reset
    dut_vif.reset = 1;
    @(posedge dut_vif.clock);
    #1;
    dut_vif.reset = 0;
    
    // Now drive normal traffic
    forever begin
      seq_item_port.get_next_item(req);

      // Wiggle pins of DUT
      dut_vif.data_a  = req.data_a;
      dut_vif.data_b = req.data_b;
      @(posedge dut_vif.clock);

      seq_item_port.item_done();
    end
  endtask

endclass: my_driver
