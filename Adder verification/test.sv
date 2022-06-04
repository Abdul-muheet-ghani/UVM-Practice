`include "environment.sv"

program test;
    environment env;

    initial begin
        env = new();
    end
endprogram