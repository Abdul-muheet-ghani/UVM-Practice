module factorial;
      
  function automatic int factorial1(input int b); 
    if(b<2) return 1;
    else return b*factorial1(b-1);
      endfunction

    function int factorial2(input int c); 
    if(c<2) return 1;
    else return c*factorial2(c-1);
      endfunction
  
  initial begin
    $display("The Value of result factorial1 = ",factorial1(3));  //it return value 6
    $display("The Value of result factorial2 = ",factorial2(3));  //while its return 1 which is incorrect
  end
endmodule
