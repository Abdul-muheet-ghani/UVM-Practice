`include "environment.sv"

program test(intf in);
    environment env;

    initial begin
        env = new(in);
      env.run();
    end
endprogram