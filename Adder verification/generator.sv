class generator;

    transaction tr;
    mailbox mbx;

    function new(mailbox mbx);
        this.mbx = mbx;        //class has global variable mbx and function new arguement mbx is local so initialize the local arguement value to the global variable of the same name "mbx" we use "this."
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
