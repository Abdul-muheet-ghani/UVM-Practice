class Transaction;

bit [31:0]src, dst, csm, data[8];

    function void calcCsm();
        csm = src ^ dst ^ data.xor();
    endfunction 

    function void print();
        $display("Transaction class src=%b,dst=%b,csm=%b,data=%b",src,dst,csm,data);
    endfunction

    function void copy(Transaction rhs_h);
        src = rhs_h.src;
        dst = rhs_h.dst;
        csm = rhs_h.csm;
        data = rhs_h.data;
    endfunction

    function Transaction clone();
        clone = new();
        clone.copy(this);
    endfunction
endclass //Transaction