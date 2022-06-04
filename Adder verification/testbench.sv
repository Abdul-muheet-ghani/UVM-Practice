`include "interface.sv"
`include "test.sv"

module testbench;

    intf pif();
    test tb(pif);

    full_adder t(
        .a(pif.a),
        .b(pif.b),
        .cin(pif.cin),
        .sum(pif.sum),
        .carry(pif.carry)
    );
    
    initial begin
//      $display("input from test a=%b,b=%b,cin=%b",pif.a,pif.b,pif.cin);
        $dumpfile("dump.vcd");
        $dumpvars(1);
    end
endmodule