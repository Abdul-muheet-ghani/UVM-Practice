# UVM Example Driver and Sequencer
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