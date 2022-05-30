//this example display the output from class abc.m_var under 3 to 7
class ABC;
  rand bit [3:0] m_var;
  constraint c_var {m_var inside{[3:7]};} //inside operator set the logic 1 when m_var is under 3:7 
endclass

module tb;
  initial begin
    ABC abc = new();
    repeat(5) begin
      abc.randomize();
      $display("abc.n_var = ",abc.m_var);
    end
  end
endmodule