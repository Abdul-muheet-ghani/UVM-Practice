module full_adder (
  input a,
  input b,
  input cin,
  output sum,
  output carry

);

    assign sum = a ^ b ^ cin;
    assign carry = (a & b) | (a ^ b & cin); 
    
endmodule