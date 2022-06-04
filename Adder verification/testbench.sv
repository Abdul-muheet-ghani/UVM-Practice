`include "interface.sv"
`include "test.sv"

module testbench;

    intf pif();
    test tb(pif);

    full_adder(
        .a(pif.a),
        .b(pif.b),
        .cin(pif.cin),
        .sum(pif.sum),
        .carry(pif.carry)
    );
    
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(1);
    end
endmodule