class concurrent;

    rand bit [2:0] x,y,z;    //for randomization

    constraint conc{
      x<y;
      y<10;
      x<5;
      x+y == z;             //run concurrently
        }
endclass //randomization

module randomize_class_module ;

    concurrent ran_h;
    int count[int] = '{default:0};
    initial begin
        ran_h = new();
        repeat(10) begin
          if(ran_h.randomize()) begin                  //if randomization occur
            $display("x =%d,y =%d,z =%d",ran_h.x,ran_h.y,ran_h.z);
            count[ran_h.x]++;
            end
            else begin
                $display("error");
            end
        end
        $display(count);
    end
    
endmodule