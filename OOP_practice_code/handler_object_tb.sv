class animal;
  int teeth;
  function new(int teeth);
    this.teeth = teeth;                //assign global variable using local arguement
    $display("this is animal class");
  endfunction
endclass

class mouth;
  animal a_h;
  function new (int teeth);
    a_h = new(teeth);
    $display("this is mouth class");
  endfunction
endclass

module obj;
mouth b_h;           //this is handle of class
initial begin
  b_h = new(7);      //this is object of class
  $display("Teeth of animal = %d",b_h.a_h.teeth); //b_h is the handler of mouth and in mouth a_h is the handler of animal class
end
endmodule