// ---------------------------
// Guia_05_02 - ALU - 2b
// Nome: Alan Diniz Nogueira Machado
// Matricula: 405782
// Objetivo: Utilizar a linguagem Verilog
// 	para implementar um método para a construir uma unidade lógica aritmética para subtrair números de 2 bits.
// Teste:
//| num1 | num2 | Bout | result |
//+------+------+------+--------+
//|  00  |  00  |  0   |   00   |
//+------+------+------+--------+
//|  00  |  01  |  1   |   11   |
//+------+------+------+--------+
//|  00  |  10  |  1   |   10   |
//+------+------+------+--------+
//|  00  |  11  |  1   |   01   |
//+------+------+------+--------+
//|  01  |  00  |  0   |   01   |
//+------+------+------+--------+
//|  01  |  01  |  0   |   00   |
//+------+------+------+--------+
//|  01  |  10  |  1   |   11   |
//+------+------+------+--------+
//|  01  |  11  |  1   |   10   |
//+------+------+------+--------+
//|  10  |  00  |  0   |   10   |
//+------+------+------+--------+
//|  10  |  01  |  0   |   01   |
//+------+------+------+--------+
//|  10  |  10  |  0   |   00   |
//+------+------+------+--------+
//|  10  |  11  |  1   |   11   |
//+------+------+------+--------+
//|  11  |  00  |  0   |   11   |
//+------+------+------+--------+
//|  11  |  01  |  0   |   10   |
//+------+------+------+--------+
//|  11  |  10  |  0   |   01   |
//+------+------+------+--------+
//|  11  |  11  |  0   |   00   |
//+------+------+------+--------+
//----------------------------

// ---------------------
// --  halfsubtractor
// ---------------------

module halfsubtractor (s0, s1, p, q);
 output s0, s1, s9;
 input  p, q;

 xor XOR1 (s0, p, q);
 not NOT1 (s9, p);
 and AND(s1, s9, q); 
endmodule // halfsubtractor

// ---------------------
// --  fullsubtractor
// ---------------------

module fullsubtractor (s2, s4, a, b, c); //--c = borrow
 output s0, s1, s2, s3, s4;
 input  a, b, c;

 halfsubtractor HS1 (s0, s1, a, b);
 halfsubtractor HS2 (s2, s3, s0, c);
 or OR1 (s4, s1, s3);
endmodule // fullsubtractor

// ---------------------
// --  ULA 2-bits 
// ---------------------

module ula (s4, s3, a, b); //-- a - b
 output s0, s1, s2, s3;
 output [1:0]s4;
 input [1:0]a, b;

 halfsubtractor HS1 (s0, s1, a[0], b[0]);
 fullsubtractor FS1 (s2, s3, a[1], b[1], s1);
 assign s4[0] = s0;
 assign s4[1] = s2;
endmodule // ula

// ---------------------
// -- test
// ---------------------

module test;
 reg [1:0]a,b;             
 wire s1;
 wire [1:0] s0;
          // instancia
 ula ULA1 (s0, s1, a, b);//-- a-b

 initial begin:start
      a=2'b00; b=2'b00;
 end

          // parte principal
 initial begin:main
      $display("Guia_05_02 - Alan Diniz Nogueira Machado - 405782");
      $display("Test ALU 2bits");
      $display("\n a  -  b  = Bout sub\n");
      $monitor("%3b - %3b =  %b  %3b", a, b, s1, s0);
  #1  a=2'b00; b=2'b01;
  #1  a=2'b00; b=2'b10;
  #1  a=2'b00; b=2'b11;
  #1  a=2'b01; b=2'b00;
  #1  a=2'b01; b=2'b01;
  #1  a=2'b01; b=2'b10;
  #1  a=2'b01; b=2'b11;
  #1  a=2'b10; b=2'b00;
  #1  a=2'b10; b=2'b01;
  #1  a=2'b10; b=2'b10;
  #1  a=2'b10; b=2'b11;
  #1  a=2'b11; b=2'b00;
  #1  a=2'b11; b=2'b01;
  #1  a=2'b11; b=2'b10;
  #1  a=2'b11; b=2'b11;
end

endmodule // test