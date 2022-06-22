class randomization;

  rand bit [2:0] dice;    //for randomization
    bit [2:0] variable;

    constraint dice_value{
      dice inside {[1:6]};     //constraint uses inside operator for range
        }
        
endclass //randomization

module randomize_class_module ;

    randomization ran_h;
    initial begin
        ran_h = new();
        repeat(10) begin
          if(ran_h.randomize()) begin                  //if randomization occur
                $display("dice value = ",ran_h.dice);
            end
            else begin
                $display("error");
            end
        end
    end
    
endmodule