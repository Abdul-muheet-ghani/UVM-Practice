class BadTr extends Transaction;

    bit badCsm;
    function void calcCsm();
        super.calcCsm();
        if(badCsm) csm = ~csm;
    endfunction //new()

    function void print();
        $write("Bad transaction badCsm=%b"badCsm);
        super.print();
    endfunction

    function void copy(Transaction rhs_h);
        badCsm = rhs_h.badCsm;
    endfunction

    function Transaction clone();
    
endclass //BadTr extends superClass