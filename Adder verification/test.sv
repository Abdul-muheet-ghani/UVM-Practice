`include "environment.sv"

program test;
    environment env;

    function new(intf in);
        env = new();
        
    endfunction
endprogram