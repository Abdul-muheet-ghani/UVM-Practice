class mem_sequence extends uvm_sequence#(mem_seq_item);
   
    `uvm_object_utils(mem_sequence)
      
    //Constructor
    function new(string name = "mem_sequence");
      super.new(name);
    endfunction
     
    virtual task body();
   
      req = mem_seq_item::type_id::create("req");  //create the req (seq item)
      wait_for_grant();                            //wait for grant
      assert(req.randomize());                     //randomize the req                   
      send_request(req);                           //send req to driver
      wait_for_item_done();                        //wait for item done from driver
      get_response(rsp);                           //get response from driver
   
    endtask
  endclass
   