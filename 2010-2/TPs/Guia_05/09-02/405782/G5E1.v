// ---------------------------
// Guia_05_01 - ALU + 3b
// Nome: Alan Diniz Nogueira Machado
// Matricula: 405782
// Objetivo: Utilizar a linguagem Verilog
// 	para implementar um método para a construir uma unidade lógica aritmética para somar números de 3 bits.
// Teste:
//| num1  | num2 | Cout | result |
//+-------+------+------+--------+
//|  000  |  000 |  0   |   000  |
//+-------+------+------+--------+
//|  000  |  010 |  0   |   010  |
//+-------+------+------+--------+
//|  001  |  001 |  0   |   010  |
//+-------+------+------+--------+
//|  001  |  011 |  0   |   100  |
//+-------+------+------+--------+
//|  010  |  010 |  0   |   100  |
//+-------+------+------+--------+
//|  010  |  001 |  0   |   011  |
//+-------+------+------+--------+
//|  011  |  100 |  0   |   111  |
//+-------+------+------+--------+
//|  011  |  011 |  0   |   110  |
//+-------+------+------+--------+
//|  100  |  111 |  1   |   011  |
//+-------+------+------+--------+
//|  100  |  101 |  1   |   001  |
//+-------+------+------+--------+
//|  101  |  110 |  1   |   011  |
//+-------+------+------+--------+
//|  101  |  011 |  1   |   000  |
//+-------+------+------+--------+
//|  110  |  000 |  0   |   110  |
//+-------+------+------+--------+
//|  110  |  100 |  1   |   010  |
//+-------+------+------+--------+
//|  111  |  001 |  1   |   000  |
//+-------+------+------+--------+
//|  111  |  010 |  1   |   001  |
//+-------+------+------+--------+
//----------------------------

// ---------------------
// --  halfadder
// ---------------------

module halfadder (s0, s1, p, q);
 output s0, s1;
 input  p, q;

 xor XOR1 (s0, p, q);
 and AND(s1, p, q); 
endmodule // halfadder

// ---------------------
// --  fulladder
// ---------------------

module fulladder (s2, s4, a, b, c);
 output s0, s1, s2, s3, s4;
 input  a, b, c;

 halfadder HA1 (s0, s1, a, c);
 halfadder HA2 (s2, s3, s0, b);
 or OR1 (s4, s1, s3);
endmodule // fulladder

// ---------------------
// --  ULA 3-bits
// ---------------------

module ula (s5, s6, a, b);
 output s0, s1, s2, s3, s4, s6;
 output [2:0]s5;
 input [2:0]a, b;

 halfadder HA1 (s0, s1, a[0], b[0]);
 fulladder FA1 (s2, s3, a[1], b[1], s1);
 fulladder FA2 (s4, s6, a[2], b[2], s3);
 assign s5[0] = s0;
 assign s5[1] = s2;
 assign s5[2] = s4;
endmodule // ula

// ---------------------
// -- test
// ---------------------

module test;
 reg [2:0]a,b;             
 wire s1;
 wire [2:0] s0;
          // instancia
 ula ULA1 (s0, s1, a, b);

 initial begin:start
      a=3'b000; b=3'b000;
 end

          // parte principal
 initial begin:main
      $display("Guia_05_01 - Alan Diniz Nogueira Machado - 405782");
      $display("Test ALU 3bits");
      $display("\n a  +  b  = Cout sum\n");
      $monitor("%3b + %3b =   %b  %3b", a, b, s1, s0);
  #1  a=3'b000; b=3'b010;
  #1  a=3'b001; b=3'b001;
  #1  a=3'b001; b=3'b011;
  #1  a=3'b010; b=3'b010;
  #1  a=3'b010; b=3'b001;
  #1  a=3'b011; b=3'b100;
  #1  a=3'b011; b=3'b011;
  #1  a=3'b100; b=3'b111;
  #1  a=3'b100; b=3'b101;
  #1  a=3'b101; b=3'b110;
  #1  a=3'b101; b=3'b011;
  #1  a=3'b110; b=3'b000;
  #1  a=3'b110; b=3'b100;
  #1  a=3'b111; b=3'b001;
  #1  a=3'b111; b=3'b010;
  
end
endmodule // test