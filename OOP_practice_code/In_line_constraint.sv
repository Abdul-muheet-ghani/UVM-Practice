//create another contraint in existing constraint using "with"
//this constraint called as in line constraint
class random;            
  //properties
  rand bit [3:0] a;              //rand generate random value with repititive calues
  rand bit [3:0]b;
  randc bit[3:0]d;               //randc is cyclic randomization in which repition is not generates  
  
  constraint c1{                 //in constraint we will define boundary so a is in between 2 to 10 
    a>2 && a<10;
    b>6 && b<15;
    d>1 && d<9;
  }
endclass

module top;
  random c;                       //class handler
  initial begin
    c = new();                    //initialize memory to class through built in function
    repeat(2) begin
      c.randomize with {a>5 && a<8;};  // using "with"  we wil create another contraint in c1 i.e in class range is 2 to 10 and in this line range is 5 to 7
      $display("a=%d,b=%d,d=%d",c.a,c.b,c.d);
    end
  end
endmodule