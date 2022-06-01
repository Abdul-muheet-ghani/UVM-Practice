//sovle before constraint use for for checking second properties that if d==4 b==1 so b is solve first before d
class random;            
  //properties
  rand bit [3:0] a;              //rand generate random value with repititive calues
  rand bit [3:0]b;
  rand bit[3:0]d;               //randc is cyclic randomization in which repition is not generates  
  
  constraint c1{                 //in constraint we will define boundary so a is in between 2 to 10 
    a dist{3:=1,5:=2};           //weitage is 1:2 of number 3 and 2 in randomization output
    (b==1)->(d==4);              //when at output of d==4 "b" is solve before d and set to 1
    solve b before d;
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