class BaseTest;

    generator gen_h;
    function new();
        gen_h = new();
    endfunction //new()

    task run();
        gen_h.run();
    endtask 
endclass //BaseTest

module top ();
    BaseTest test_h;
    initial begin
        test_h = new();
        test_h.run();
    end
endmodule