class generator;

    transaction tr;
    mailbox mbx;

    function new(mailbox mbx);
        this.mbx = mbx;
    endfunction //new()

    task automatic run();
    begin
        tr = new();
        tr.a = 1;
        tr.b = 1;
        tr.cin = 0;

        $$display("Transaction a=%b,b=%b,cin=%b",tr.a,tr.b,tr.cin);

        mbx.put(tr);

    end
    endtask //automatic


endclass //generator