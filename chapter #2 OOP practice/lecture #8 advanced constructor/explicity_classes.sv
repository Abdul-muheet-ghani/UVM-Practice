class car;
    string colour;
    function new(string c);
        colour = c;
        $display("colour =",colour);
    endfunction //new()
endclass //car

class porsche extends car;
    function new(string c);
        super.new(c);
        $display("porsche");
    endfunction //new()
endclass //porsche extends car

module top;
    initial begin
      porsche p_h = new(" BLACK");  //OUTPUT   # KERNEL: colour = BLACK # KERNEL: porsche
    end
endmodule