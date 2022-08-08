# Communication Between the Component

In this chapter we focused on the transaction between sequencer driver then test and DUT

DUT is connected with driver DUT only recieve the data only when they are ready on the left of driver generator is connected so driver controll the transaction 

```
class generator                 |  class driver;                |  class agent
    task get(tx_item tx)        |   generator g;                |       generator g = new()
        tx = new();             |       task run();             |       driver d = new(g)
        if(!randomize())        |           forever begin       |       task run()
    endtask                     |               g.get(tx);      |           d.run();
endclass                        |               transfer(tx);   |       endtask
                                |            end                |   endclass
                                |        endtask                |
                                |    endclass                   |
```

so the driver is initiator of the transfer, and generator is the target for transfer
> Problem: the connection hard-coded class names and a fixed topology
> Solution: Add the layer between the two components 