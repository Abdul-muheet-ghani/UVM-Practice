




class tx_driver extends uvm_driver #(tx_sequence);
    `uvm_component_utils(tx_driver)
  
   virtual dut_int vdut_int;
    function new(string name, uvm_component parent);
      super.new(name,parent);
    endfunction
    
      function void build_phase(uvm_phase phase);
      // Get interface reference from config database
        if(!uvm_config_db#(virtual dut_int)::get(this, "", "dut_vif", vdut_int)) begin
        `uvm_error("", "uvm_config_db::get failed")
      end
    endfunction
    
      task run_phase (uvm_phase phase);
        vdut_int.reset = 1;
        @(posedge vdut_int.clk);
        vdut_int.reset = 0;
        forever begin
          set_item_port.get_next_item(req);
          vdut_int.result = req.result;
          vdut_int.data_a = req.data_a;
          vdut_int.data_b = req.data_b;
          @(posedge vdut_int.clk);
          seq_item_port.done_item();
        end
      endtask
    
  endclass