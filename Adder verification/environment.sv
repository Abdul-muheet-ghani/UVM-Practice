`include "transaction"
`include "generator"
`include "driver"

class environment;

    generator gen;
    driver drv;
    mailbox mbx;
    virtual interface intf;

    function new(virtual interface intf);

        this.intf = intf;
        mbx = new();
        gen = new(mbx);
        drv = new(intf,mbox);

    endfunction //new()

    task automatic run();
        fork
            gen.run();
            drv.run();
        join
    endtask //automatic
endclass //environment