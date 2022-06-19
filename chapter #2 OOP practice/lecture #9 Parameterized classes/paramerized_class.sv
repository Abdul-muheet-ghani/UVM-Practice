class vector #(parameter t);

    bit [t-1:0] para;
    function new();
        para = t;
        $display("value of parameter = ",para);
    endfunction //new()

endclass //vector #(Parameter t)

module moduleName ;
    function v4_t connect_four();
        nibble_h.para = 4'b0101;
        return nibble_h;    
    endfunction
    
    initial begin
        vector #(.t(64)) v4_h;
        v4_h nibble_h = new();
    end    
endmodule
