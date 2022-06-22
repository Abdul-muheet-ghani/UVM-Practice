class Transaction;

bit [31:0]src, dst, csm, data;

    function void calcCsm();
        csm = src ^ dst ^ data;
    endfunction 

    function void print();
      $display("Transaction class src=%b,dst=%b,csm=%b,data=%b",src,dst,csm,data);
    endfunction

    function void copy(Transaction rhs_h);
        src = rhs_h.src;
        dst = rhs_h.dst;
        csm = rhs_h.csm;
        data = rhs_h.data;
      $display("From main Transaction class");
    endfunction

    function Transaction clone();
        clone = new();
        clone.copy(this);
    endfunction
endclass //Transaction

class BadTr extends Transaction;

    bit badCsm;
    function void calcCsm();
        super.calcCsm();
        if(badCsm) csm = ~csm;
    endfunction //new()

    function void print();
      $write("Bad transaction badCsm=%b",badCsm);
        super.print();
    endfunction

    function void copy(BadTr rhs_h);
        badCsm = rhs_h.badCsm;
    endfunction

    function Transaction clone();
    endfunction
endclass //BadTr extends superClass
      
class generator;

    Transaction blueprint_h,tr_h;
    function new();
        blueprint_h = new();
    endfunction //new

    task  run();
        for (int i=0; i<10; i++) begin
            tr_h = blueprint_h.clone();
            tr_h.src = i;
            tr_h.dst = i;
            tr_h.data = i;
            tr_h.calcCsm();
            drive(tr_h);
        end
    endtask //

    task drive(Transaction tr_h);
        $display("drived output is tr_h.src=%d,tr_h.dst=%d,tr_h.csm=%d,tr_h.data=%d",tr_h.src,tr_h.dst,tr_h.csm,tr_h.data);
    endtask //
     
endclass //generator
      
class BaseTest;

    generator gen_h;
    function new();
        gen_h = new();
    endfunction //new()

    task run();
        gen_h.run();
      $display("BaseTest run");
    endtask 
endclass //BaseTest

class BadTest extends BaseTest;

    BadTr badBlue_h;
    function new();
        super.new();
        badBlue_h = new();
        badBlue_h.badCsm = 1;
        gen_h.blueprint_h = badBlue_h;
    endfunction //new()
endclass //BadTest extends BaseTest

module top ();
    BaseTest test_h;
    BadTest  test2_h;
    initial begin
        test_h = new();
        test2_h = new();
        test_h.run();
        test2_h.run();
    end
endmodule