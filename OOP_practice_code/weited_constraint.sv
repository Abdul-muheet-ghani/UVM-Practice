///weighted constraint is like wietage of any number in randomization i.e in range between 2 till 10 we want more 7,3,4 so we will generate these number using dist in wieted constraint
class random;            
  //properties
  rand bit [3:0] a;              //rand generate random value with repititive calues
  rand bit [3:0]b;
  randc bit[3:0]d;               //randc is cyclic randomization in which repition is not generates  
  
  constraint c1{                 //in constraint we will define boundary so a is in between 2 to 10 
    a dist{3:=1,5:=2};           //weitage is 1:2 of number 3 and 2 in randomization output
    b>6 && b<15;
    d>1 && d<9;
  }
endclass

module top;
  random c;                       //class handler
  initial begin
    c = new();                   //initialize memory to class through built in function  
    repeat(10) begin 
      c.randomize();
      $display("a=%d,b=%d,d=%d",c.a,c.b,c.d);
    end
  end
endmodule