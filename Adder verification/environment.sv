`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"

class environment;

    generator gen;
    driver drv;
    mailbox mbx;
    virtual interface intf;

    function new(virtual interface intf);

        this.intf = intf;
        mbx = new();
        gen = new(mbx);
        drv = new(intf,mbx);

    endfunction //new()

    task automatic run();
        fork
            gen.run();
            drv.run();
        join
    endtask //automatic
endclass //environment