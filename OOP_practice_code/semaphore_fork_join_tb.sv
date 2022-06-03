//semaphore is used when the one process is access the same process at the same time
//bike

module tb;
  
  semaphore key=new(1);
  
  initial begin
      repeat (2)begin
         fork
        /////process one
        begin
          $display("[A] A want to access the key at %0t",$time);
          key.get(1);
          $display("[A] A getting the access of key at %0t",$time);
          #10
          key.put(1);
          $display("[A] A return back the key at %0t",$time);

        end
        
        ///////process two
        begin
          $display("[B] B want to access the key at %0t",$time);
          key.get(1);
          $display("[B] B getting the access of key at %0t",$time);
          #10
          key.put(1);
          $display("[B] B return back the key at %0t",$time);
        end
           
            join
      end
    
    
  end
endmodule