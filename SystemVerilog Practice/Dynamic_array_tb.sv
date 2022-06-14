module tb;
  int x_d[];             //initialize empty dynamic array
  int y_d[] = '{0,1,2};  //initialize array with size 3
  int w_d[100];          //initialize fixed array of size 100
  
  initial begin
    $display(x_d.size());  //display 0 x_d.size display the size of queue
    x_d = y_d;

    $display(x_d.size());  //display 3
    x_d = w_d;
    
    $display(x_d.size());  //display 100
    x_d.delete();
    $display(x_d.size());  //display 0
  end
endmodule
