//OOP Encapsulation means hiding the data i.e locally defines means properties cannot be access in any other class but we will use protected so protected variable in parent class is just visible into the child class 
class parent;                    //parent class
  bit [5:0]a;                    //properties
  bit [5:0]b;
  protected bit [31:0]area;      // we will just protect area variable because it is used in child of the parent but we will not protect a and b because this variable are global and used in the tb module
  
  function var1();               
    area = 2*b;
    $display("area=%d",area);
  endfunction
endclass

class child extends parent();     //child class which extend from parent
  bit [31:0]c;
  
  function rectan();
    super.var1();
    c = area*b;                   //area is return from function var1 in parent class function
    $display("c=%d",c);
    super.var1();
  endfunction
  
endclass

module tb;
  child d;
  initial begin
    d = new();
    d.a = 10;
    d.b = 20;
    d.rectan();                   //d is the handler of child class so we will call the function of child from handler
  end
endmodule 