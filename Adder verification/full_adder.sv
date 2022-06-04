module full_adder (
    input [4:0]a;
    input [4:0]b;
    input [4:0]cin;
    output [4:0]sum;
    output [4:0]carry;

);

    assign sum = a ^ b ^ cin;
    assign carry = (a & b) | (a ^ b & cin); 
    
endmodule