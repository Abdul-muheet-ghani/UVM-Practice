interface BUS;                      //Interface initialization
  logic [7:0] addr,data;
  logic RWn;
endinterface

module tb;
  BUS bus_interface();              //bus_interface is the instance of the BUS interface
  logic [7:0] mem[7:0];
  The_bus the_ram (.mem_bus(bus_interface));  //the_ram is the instance of The_bus module where mem_bus is another instance of BUS
  initial begin
    bus_interface.RWn = 0;               // Drive and monitor the bus
    bus_interface.addr = 0;
    for (int I=0; I<7; I++)
      bus_interface.addr = bus_interface.addr + 1;
    bus_interface.RWn = 1;
    bus_interface.data  = mem[0];
    
  end
endmodule

module The_bus(BUS mem_bus);
  logic [7:0] mem[0:255];
  
  always@*
    if(mem_bus.RWn)
      mem_bus.data = mem[mem_bus.addr];
  else
    mem[mem_bus.addr] = mem_bus.data;
  
endmodule