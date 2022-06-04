class generator;

    transaction tr;
    mailbox mbx;

    function new(mailbox mbx);
        this.mbx = mbx;
    endfunction //new()

    task run();
    begin
      repeat(9) begin
        tr = new();
        tr.randomize();
       // tr.a = 1;
       // tr.b = 1;
       // tr.cin = 0;

      $display("Input Transaction a=%b,b=%b,cin=%b",tr.a,tr.b,tr.cin);

        mbx.put(tr);
      end

    end
    endtask //automatic


endclass //generator