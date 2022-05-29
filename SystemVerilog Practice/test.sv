// Testbench
// $test$plusargs is used for controlling simulation through command line
// Avoid the recompilation of testbench
module test;

  task write_data;
    begin
      $display("write data is called ...");
    end
  endtask
  
  task read_data;
    begin
      $display("read data is called ...");
    end
  endtask
  
  task read_write_data;
    begin
      $display("read write data is called ...");
    end
  endtask
  
  initial begin
    if($test$plusargs("write")) write_data;                //"write is the arguement which return 1'b1 in if block so if arguement is pass through command line i.e "write" then it returns 1'b1 else 1'b0"
    else if($test$plusargs("read")) read_data;
    else if($test$plusargs("READ_WRITE")) read_write_data;
    else $display("nothing is called ....");
  end
endmodule
