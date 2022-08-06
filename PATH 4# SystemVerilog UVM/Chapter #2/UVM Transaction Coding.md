# Transaction 

All the DUT input are randomize two state data type and output of DUT is not randomize and 4 state data type

we also separate as `tx_in` and `tx_out`

```
class tx_item extends uvm_sequence_item;
    //factory macro
    `uvm_object_utils(tx_item)
    //Constructor
    function new(string name = "tx_item")
        super.new(name);
    endfunction

    //properties
    rand bit [31:0]  data;
    rand bit [31:0]  address;
    rand command_t   cmd;
        logic [31:0] result;

endclass
```