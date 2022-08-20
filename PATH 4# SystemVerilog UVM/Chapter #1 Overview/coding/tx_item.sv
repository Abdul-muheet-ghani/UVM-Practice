//  Class: tx_item 
//
class tx_item extends uvm_sequence_item;
    `uvm_objecct_utils(tx_item)

    rand int addr[7:0]; 

    constraint {addr >= 0; addr <= 256;}
    //  Constructor: new
    function new(string name = "tx_item");
        super.new(name);
    endfunction: new
    

endclass: tx_item 
