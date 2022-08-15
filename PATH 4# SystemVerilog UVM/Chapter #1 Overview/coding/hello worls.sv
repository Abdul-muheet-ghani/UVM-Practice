// Code your testbench here
// or browse Examples

//-------------------------------------------------

package hello_pkg;
    `include "uvm_macros.svh"
    import uvm_pkg::*;
    class hello_test extends uvm_test;
      `uvm_component_utils(hello_test)
      function new(string name, uvm_component parent);
        super.new(name,parent);
      endfunction 
      
      virtual task run_phase(uvm_phase phase);
        `uvm_info("ID","hello_workd",UVM_LOW)
      endtask
    endclass
    endpackage
    
    module top
      import uvm_pkg::*;
      import hello_pkg::*;
      
      initial run_phase();
    endmodule