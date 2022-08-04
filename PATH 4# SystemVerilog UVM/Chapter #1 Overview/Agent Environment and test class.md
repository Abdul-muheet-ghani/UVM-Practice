# Agent Bundels Protocol Classes
Agent Encapsulate the component like driver monitor and sequencer which communicate DUT throgh the interface. Agent contains building and connecting of this component as shown in the example.

Agent bundel them all the component in tx_agent which drived from uvm_agent base class. 
```
    tx_driver drv;
    tx_monitor mon;
    uvm_sequencer#(tx_item) sqr;
```
the bundel contain the handle of component like driver monitor and sequencer. Agent creates component during the build phase. then the connect phase is started where the driver is connected with sequencer on the TLM transaction level modeling

```
class tx_agent extends uvm_agent;
    `uvm_component_utils(tx_agent);
    function new(string name, uvm_component parent)
        super.new(name,parent);
    endfunction

    tx_driver drv;
    tx_monitor mon;
    uvm_sequencer#(tx_item) sqr;

//build phase
    virtual function void build_phase(uvm_phase phase);
        drv=tx_driver::type_id::create("drv",this);
        mon=tx_monitor::type_id::create("mon",this);
        sqr=new("sqr",this);
    endfunction 

//Connect phase
    virtual function void connect_phase(uvm_phase phase)
        drv.seq_item_port.connet(sqr.seq_item_export);
    endfunction
endclass
```
# UVM Environment
```
class tx_env extends uvm_env;
    `uvm_component_utils(tx_env);
    function new()
        sup...
    endfunction 

    tx_agent agt;
    function build phase as same as agent
endclass
```

# Test Class
test class has environment and a sequence build phase and run phase 

