module tb;
  mailbox muheet = new();           //mail box used to transfer information and it accept all data type for specific data type mail box used parametrized and it bounded and unbounded both 
  //we will use pu for data sending and get for recieving
  
  initial begin
    bit [4:0]a;
    for (int i=0; i<10; i++) begin
    	a = $random();
    	muheet.put(a);
    	$display("Data is send a = %d",a);
    end
  end
  
  initial begin
    bit [4:0]a;
    forever begin
    	muheet.get(a);
    	$display("Data is recieve a = %d",a);
    end
  end
endmodule