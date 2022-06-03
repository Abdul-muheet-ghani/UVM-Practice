package pkg;	
	
	function int add(int a,b);
      return a+b;
	endfunction

	function print(int c);
  		$display("Value of C = %d",c);
    endfunction

endpackage

 import pkg::*;

module tb;
  
  int a = 10,b = 20;
  int c;
  
  initial begin 
    c = add(a,b);
    void'(print(c));
  end
  
endmodule