# UVM Example Driver and Sequencer

- ## Simple Transaction
In UVM uvm_driver recieve the transaction from the uvm_sequencer the driver send it to the `DUT`
Transaction classes are drived from the `uvm_sequence_item` base class 
```
class tx_item extends uvm_sequence_item
```
So, tx_item is a single transaction 
```
`uvm_object_utils(tx_item);
```
UVM object macro register from UVM factory
```
function new(string name = "tx_item")
        super.new(name);
    endfunction
```
construct identifier for object
```
    rand bit [7:0] data;

```
add property which is data,addr etc

```
class tx_item extends uvm_sequence_item
    `uvm_object_utils(tx_item);
    function new(string name = "tx_item")
        super.new(name);
    endfunction

    rand bit [7:0] data;
endclass
```

- ## Simple Driver 
Now let's show the the simple driver that how to recieve the transaction and send it to the DUT

```
class tx_driver extends uvm_driver #(tx_item);
```
A driver is the extended class from uvm_driver base class which is parameterized from sequence item 
```
    `uvm_component_utils(tx_driver);
```
driver is the component so that is why we will use component utils
```
    virtual task run_phase(uvm_phase phase);
        tx_item tx;

        forever begin
            seq_item_port.get_next_item(tx);
            transfer(tx);
            seq_item_port.item_done();
        end
        
    endtask
```
typically driver send and recieve the transaction in a run phase in forever loop 
the driver gets transaction from sequencer through transaction level modelling connection which we will use as a mail box here since we use `seq_item_port`
```
    virtual task transfer #(tx_item tr);
        `uvm_info("Transfer",$sformatf("ports"),UVM_LOW)
    endtask
```
`transfer` task which is in driver to drive and recieve the pin data 
virtual method for different data


```
class tx_driver extends uvm_driver #(tx_item);
    `uvm_component_utils(tx_driver);
    function new(string name, component parent)
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

    virtual task transfer #(tx_item tr);
        `uvm_info("Transfer",$sformatf("ports"),UVM_LOW)
    endtask

endclass
```

- ## Generating Stimulus
how to generate stimulus with UVM the question is how sequencer generate transaction. the answer is that sequencer recieve the transaction from the 1 or more sequences. so we have to differentiate between the sequences which is the object which contain a task for generating stimulus. and sequencer which controll the seq_item transaction which generate the uvm sequence. so sequence is not an heirarchy component it's an object. which tranmist transaction through the `TLM transfer level modeling` to sequencer
### Body
sequence is the code of procedural block that has been wrapped in a method call body

``` 
tx = tx_item::type_id::create("tx");
```
body task create a transaction using factory creation then 
```
start_item(tx);
```
wait for the driver to be ready at that point  
```
if(!tx.randomize());
```
randomize it 
```
finish_item(tx);
```
send the transaction and wait for the response of the driver to know the driver is ready again and then send the new transaction.

```
class tx_sequence extends uvm_sequence #(tx_iten);
    `uvm_object_utils(tx_sequence);
    function new(string name = "tx_sequence");
        super.new(name);
    endfunction

    virtual task body ();
        tx_item tx;
        repeat (5) begin
            tx = tx_item::type_id::create("tx");
            start_item(tx);
            if(!tx.randomize()); `uvm_fatal...
            finish_item(tx);
        end
    endtask
endclass
```