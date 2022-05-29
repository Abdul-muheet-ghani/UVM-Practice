//Function has return value 
//Function cannot contain delay/timing control
//Task has no return value 
//Task can contain delay/timing control

// $test$plusargs is used for controlling simulation through command line
// Avoid the recompilation of testbench
// $value$plusargs use to get the value from command line and assign it to any variable

typedef logic [1:0] user_define_type;   //User define data type which is globally define 
module ALU;
  
	user_define_type a;                 //Recalling
    user_define_type b;
    user_define_type result;
    user_define_type opcode;
  
  function void print();                                                     
        $display("The Value of result =",result);
      endfunction
  
  task write_data;
    begin
      result = (opcode == 'b01) ? (a + b) : (opcode == 'b10) ? (a - b) : 'x;
      print();                                                                 //return the value i.e The Value of result = 3
    end
  endtask
  
  initial begin
    $value$plusargs("A_value=%d",a);  // A_value is given from command line which is assign to vriable a
    $value$plusargs("B_value=%d",b);
    $value$plusargs("opc_value=%d",opcode);
    
    if($test$plusargs("write")) write_data; //"write is the arguement which return 1'b1 in if block so if arguement is pass through command line i.e "write" then it returns 1'b1 else 1'b0"
  end
endmodule