// Code your design here
interface dut_int;
    logic clk,reset;
    logic [7:0]data_a;
    logic [7:0]data_b;
    logic [7:0]result;
  endinterface
  
  `include "uvm_macros.svh"
  
  module dut(dut_int inter);
    import uvm_pkg::*;
    always@(posedge inter.clk) begin
      if(inter.reset != 1)begin
        inter.result = inter.data_a + inter.data_b;
        `uvm_info("DUT",$sformat("Adder result = 0x%h,operand a = 0x%h, operand b = 0x%h,",inter.result,inter.data_a,inter.data_b),UVM_MEDIUM)
      end
    end
      
  endmodule