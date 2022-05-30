module tb;
  struct
  {
    string a;
    int b;
    int c;
  } st_fruit;
  
  initial begin
    st_fruit = '{"fruits",8,12};
    $display("fruits = %p",st_fruit);
    
    
  end
  
endmodule