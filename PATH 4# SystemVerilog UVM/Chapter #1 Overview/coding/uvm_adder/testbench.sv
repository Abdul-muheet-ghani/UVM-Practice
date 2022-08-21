`include "uvm_macros.svh"
`include "test_bench_pkg.svh"

// The top module that contains the DUT and interface.
// This module starts the test.
module top;
  import uvm_pkg::*;
  import my_testbench_pkg::*;
  
  // Instantiate the interface
  dut_int dut_if1();
  
  // Instantiate the DUT and connect it to the interface
  dut dut1(.inter(dut_if1));
  
  // Clock generator
  initial begin
    dut_if1.clock = 0;
    forever #5 dut_if1.clock = ~dut_if1.clock;
  end
  
  initial begin
    // Place the interface into the UVM configuration database
    uvm_config_db#(virtual dut_if)::set(null, "*", "dut_vif", dut_if1);
    // Start the test
    run_test("tx_test");
  end
  
  // Dump waves
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, top);
  end
  
endmodule
