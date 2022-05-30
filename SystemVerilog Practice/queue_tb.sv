module tb;
  //create a queue which store the string 
  string fruits[$] = {"orange","apple","kiwi"};             //queue initialize with $
  
  initial begin
    foreach (fruits[i]) $display("fruits[%0d] =%s",i,fruits[i]);  //display w.r.t, I i.e on location 0,1,2  
    
    $display("fruits = %p", fruits);                              //display all element of queue
    
    fruits.delete();                                             //delete all element of the queue 
    $display("After deleion, fruits=%p",fruits);
    
    fruits.push_front("orange");
    $display("After deleion, fruits=%p",fruits);                //display orange
    fruits.push_front("apple");
    $display("After deleion, fruits=%p",fruits);                //display applye,orange because push in front
    fruits.push_back("kiwi");
    $display("After deleion, fruits=%p",fruits);                //apple,orange,kiwi
    fruits.pop_front();
    $display("After deleion, fruits=%p",fruits);                //orange,kiwi
    fruits.pop_back();
    $display("After deleion, fruits=%p",fruits);                //orange left in queue
    
  end
endmodule