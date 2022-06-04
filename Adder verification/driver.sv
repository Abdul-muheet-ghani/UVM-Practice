class driver;

    virtual intf vif;
    mailbox mbx;
    
    function new(virtual intf vif, mailbox mbx);
        vif = new();
        this.vif = new();
        this.mbx = new();
    endfunction //new()

    task automatic run();
        forever begin
            mbx.get(tr);
            vif.a = tr.a;
            vif.a = tr.a;
            vif.a = tr.a;
        #5;
            tr.sum = vif.sum;
            tr.carry = vif.carry;
            $$display("output sum =%b,carry =%b",tr.sum,tr.carry);

        end
        
    endtask //automatic

endclass //driver