class animal;
  int teeth;

  function new(int teeth);
    this.teeth = teeth;                //assign global variable using local arguement
    $display("this is animal class");
  endfunction
  
  function void copy(animal rhs_h);
    teeth = rhs_h.teeth;
  endfunction 
endclass

class mouth;

  int age;
  animal m_h;

  function new (int teeth,age);    
    this.age = age;
    m_h = new(teeth);
    $display("this is mouth class");
  endfunction
  
  function void copy(mouth rhs_h);
    age = rhs_h.age;
    m_h.copy(rhs_h.m_h);
  endfunction
endclass

module obj;
mouth b_h,d_h;           //this is handle of class
initial begin
  b_h = new(.age(7),.teeth(6));      //this is object of class
  d_h = new(.age(8),.teeth(9));      //this is object of class
  $display("Teeth of animal = %d,destination handler =%d",b_h.m_h.teeth,d_h.m_h.teeth); //b_h is the handler of mouth and in mouth a_h is the handler of animal class
  d_h.copy(b_h);
  $display("Teeth of animal = %d,destination handler =%d",b_h.m_h.teeth,d_h.m_h.teeth);
  d_h.m_h.teeth = 3;
  $display("Teeth of animal = %d,destination handler =%d",b_h.m_h.teeth,d_h.m_h.teeth);
end
endmodule