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
