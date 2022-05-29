module enum_tb;
  
  enum{start=5,address,data,stop} packet;
  
  initial begin
    packet = start;                                                       //for getting value of enum 
    $display("value of start %d",packet);
    
    
    packet = packet.first();                                              //getting name and value of enum list packet.name() used for naming convention
    $display("first element is %s and value is %d",packet.name(),packet); 
    
    packet = packet.next();                                              //getting name and value of enum 2nd variable in list packet.name() used for naming convention
    $display("next element is %s and value is %d",packet.name(),packet); 
    
    packet = packet.prev();                                              //getting name and value of previous variable from enum list packet.name() used for naming convention
    $display("prevevious element is %s and value is %d",packet.name(),packet);
    
    $display("number of element in enum is %d",packet.num());   //packet num is used for element numbering in enum list
  end
  
  
endmodule