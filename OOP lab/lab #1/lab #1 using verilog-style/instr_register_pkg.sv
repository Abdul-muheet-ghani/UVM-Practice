package instr_register_pkg;

    `timescale 1ns/1ns;

    typedef enum logic [3:0] { 
        ADD,
        SUB,
        DIV,
        MUL,
        FPU
    } opcode_t;

    typedef logic signed [31:0] operand_t;
    typedef logic [4:0] address_t;

    typedef struct {
        opcode_t opc;
        operand_t op_a;
        operand_t op_b;
    } instruction_t;
endpackage