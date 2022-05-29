// Testbench
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
    if($test$plusargs("write")) write_data;
    else if($test$plusargs("read")) read_data;
    else if($test$plusargs("READ_WRITE")) read_write_data;
    else $display("nothing is called ....");
  end
endmodule
