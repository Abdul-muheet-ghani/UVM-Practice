class math;

    rand bit [1:0] a,b,c;    //for randomization
    constraint rad_c{
     			  {3'(a + b) == c};     //constraint select value of a and b for equal to c
        }                               //2'b1 + 2'b3 = 2'b0
                                        //3'(2'b1 + 2'b3 = 2'b0) = 3'd4
                                        //3'(expression) solve overflow problem
endclass //math

module overfllow_limit ;

    math ran_h;
    int a_value_count[int] = '{default:0};
    int b_value_count[int] = '{default:0};
    int c_value_count[int] = '{default:0};
    initial begin
        ran_h = new();
        repeat(10) begin
          if(ran_h.randomize()) begin                  //if randomization occur
                $display("value of a =%d,value of b =%d,value of c =%d",ran_h.a,ran_h.b,ran_h.c);
            a_value_count[ran_h.a]++;                  //count the repeat value of a
            b_value_count[ran_h.b]++;
            c_value_count[ran_h.c]++;
            end
            else begin
                $display("error");
            end
        end
        $display(a_value_count);
        $display(b_value_count);
        $display(c_value_count);
    end
    
endmodule