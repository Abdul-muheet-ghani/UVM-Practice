class driver;

    virtual intf vif;
    mailbox mbx;
    transaction tr;
    
    function new(virtual intf vif, mailbox mbx);
        tr = new();
        this.vif = vif;
        this.mbx = mbx;
    endfunction //new()

    task run();
        forever begin
            mbx.get(tr);
            vif.a = tr.a;
            vif.b = tr.b;
            vif.cin = tr.cin;
        #5;
            tr.sum = vif.sum;
            tr.carry = vif.carry;
           // $display("output from driver a =%b,b =%b,cin =%b",vif.a,vif.b,vif.cin);
            $display("output sum =%b,carry =%b",tr.sum,tr.carry);

        end
        
    endtask //automatic

endclass //driver