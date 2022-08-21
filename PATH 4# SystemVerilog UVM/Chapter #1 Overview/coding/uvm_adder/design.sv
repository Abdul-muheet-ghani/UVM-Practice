// This is the SystemVerilog interface that we will use to connect
// our design to our UVM testbench.
interface dut_if;
    logic clock, reset;
    logic [7:0] data_a;
    logic [7:0] data_b;
    logic [7:0] result;
  endinterface
  
  `include "uvm_macros.svh"
  
  // This is our design module.
  // 
  // It is an empty design that simply prints a message whenever
  // the clock toggles.
  module dut(dut_if dif);
    import uvm_pkg::*;
    always @(posedge dif.clock)
      if (dif.reset != 1) begin
        dif.result = dif.data_a + dif.data_b;
        `uvm_info("DUT",$sformatf("Adder result = 0x%h,operand a = 0x%h, operand b = 0x%h,",dif.result,dif.data_a,dif.data_b),UVM_MEDIUM)
      end
  endmodule
  