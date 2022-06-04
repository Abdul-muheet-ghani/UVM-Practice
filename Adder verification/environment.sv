`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"

class environment;

    generator gen;
    driver drv;
    mailbox mbx;
    virtual intf vif;

  function new(virtual intf vif);

        this.vif = vif;
        mbx = new();
        gen = new(mbx);
      drv = new(vif,mbx);

    endfunction //new()

    task run();
        fork
            gen.run();
            drv.run();
        join
    endtask //automatic
endclass //environment