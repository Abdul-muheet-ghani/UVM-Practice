//OOP inheritance in which one parent class linked with its child classes or similarities in parent 
class parent;                    //parent class
  bit [5:0]a;                    //properties
  bit [5:0]b;
  bit [31:0]area;
  
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