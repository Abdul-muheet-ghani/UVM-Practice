package instr_register_pkg;
  timeunit 1ns; timeprecision 1ns;

  typedef enum logic [3:0] {
  	ZERO,
    PASSA,
    PASSB,
    ADD,
    SUB,
    MULT,
    DIV,
    MOD
  } opcode_t;

  typedef logic signed [31:0] operand_t;
  
  typedef logic [4:0] address_t;
  
  typedef struct {
    opcode_t  opc;
    operand_t op_a;
    operand_t op_b;
  } instruction_t;

endpackage: instr_register_pkg