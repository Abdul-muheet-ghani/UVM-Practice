# Basic flow for building and running the UVM test

Write the UVM testbench for basic flow for running the simulation

```
Package hello_pkg;
 `include "uvm_macros.svh"
 import uvm_pkg::*;       //for bring the base class library from which we extend all the component 
 class hello_world extend uvm_test; //uvm_test base class is defined in uvm_pkg
    `uvm_component_utils(hello_test);  //for all the testbench component we have a register with uvm factory
    function new(string name, uvm_component parent)  //hello_test class constructor
        super.new(name, parent);
    endfunction
    virtual task run_phase(uvm_phase phase)
        `uvm_info("ID","Hello_world","")
    endtask
 endclass 

endpackge
```
1. put your code in a package
2. bring you UVM library
3. Create a test class 
4. wrap in a top model
5. In this example there are no other other component so this run run_phase task and print the info message which is the 

```
module top
    import uvm_pkg::*;
    import hello_pkg::*;
    
    initial run_test();  //In general run_test method start the uvm phases which control order in which testbench component are build,run and report 
endmodule
```
