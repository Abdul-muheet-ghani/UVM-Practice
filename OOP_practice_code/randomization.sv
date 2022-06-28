class random;            
  //properties
  rand bit [3:0] a;              //rand generate random value with repititive calues
  rand bit [3:0]b;
  randc bit[3:0]d;               //randc is cyclic randomization in which repition is not generates 
  constraint c1{                 //in constraint we will define boundary so a is in between 2 to 10 
    a>2 && a<10;
    b>6 && b<15;
    d>1 && d<9;                  // constraints range
  }
endclass

module top;
  random c;                       //class handler
  initial begin
    c = new();                    //initialize memory to class through built in function
    repeat(10) begin
      c.randomize();             //generates the random value of a and b but repititive
      $display("a=%d,b=%d,d=%d",c.a,c.b,c.d);
    end
  end
endmodule
