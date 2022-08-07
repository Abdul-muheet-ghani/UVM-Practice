# Implement the do_*() Method

The last property is the handle of `tx_payload` which must extend from `uvm_sequence_item`. so you can implement the virtual method 

```
class tx_payload extends uvm_sequence_item
    ...
    ...
endclass
```

The Virtual lab has a transaction class similar to this one except does not have a payload handle

```
class tx_item extends uvm_sequence_item()
    //`uvm macro
    //Constructor

    //Properties
    rand bit src,dst,
    rand command_t cmd,
    rand tx_payload pay_h; 
endclass
```

![image](https://user-images.githubusercontent.com/81433387/183269880-046a2b0c-dc5f-498f-8fe9-fb6ca7cf6323.png)

# The do_copy() Method
```
class tx_item extends uvm_sequence_item;
    virtual function void do_copy(uvm_object rhs); //void do_copy has 1 arguement because the rule of OOP the type of this arguement must match the type of the base class
        tx_item tx_rhs;//the problem is that tx_item property is not visible with uvm_object handle so that is why we declare the handle of tx_item and guess the type of handle
        if(!$cast(tx_rhs,rhs));
            `uvm_fatal

        supder.do_copy(rhs);// involve the base class. my be there are some property in uvm_sequence_item that need to be copied 

        //copy the object property so any tx_item will call to this local variable
        this.src = tx_rhs.src;
        this.data = tx_rhs.data;
        this.cmd = tx_rhs.cmd;

        if((pay_h!=null) && (tx_rhs.pay_h!=null));
            pay_h.do_copy(tx_rhs.pay_h);

    endfunction 
endclass
```

# 
