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