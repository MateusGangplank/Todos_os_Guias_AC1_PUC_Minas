// ---------------------------
// Guia_05_03 - Full-Multiplier 2b
// Nome: Alan Diniz Nogueira Machado
// Matricula: 405782
// Objetivo: Utilizar a linguagem Verilog
// 	para implementar um método para a construir um multiplicador completo de 2 bits.
// Teste:
//| num1 | num2 | result |
//+------+------+--------+
//|  00  |  00  |  0000  |
//+------+------+--------+
//|  00  |  01  |  0000  |
//+------+------+--------+
//|  00  |  10  |  0000  |
//+------+------+--------+
//|  00  |  11  |  0000  |
//+------+------+--------+
//|  01  |  00  |  0000  |
//+------+------+--------+
//|  01  |  01  |  0001  |
//+------+------+--------+
//|  01  |  10  |  0010  |
//+------+------+--------+
//|  01  |  11  |  0011  |
//+------+------+--------+
//|  10  |  00  |  0000  |
//+------+------+--------+
//|  10  |  01  |  0010  |
//+------+------+--------+
//|  10  |  10  |  0100  |
//+------+------+--------+
//|  10  |  11  |  0110  |
//+------+------+--------+
//|  11  |  00  |  0000  |
//+------+------+--------+
//|  11  |  01  |  0011  |
//+------+------+--------+
//|  11  |  10  |  0110  |
//+------+------+--------+
//|  11  |  11  |  1001  |
//+------+------+--------+
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
// --  fullmultiplier
// ---------------------

module fullmultiplier (s8, p, q);
 output [3:0] s8;
 output s0, s1, s2, s3, s4, s5, s6, s7;
 input [1:0]p, q;

 and AND(s0, p[0], q[0]);
 and AND(s1, p[1], q[0]);
 and AND(s2, p[0], q[1]);
 and AND(s3, p[1], q[1]);
 
 halfadder HA1(s4, s5, s1, s2);
 halfadder HA2(s6, s7, s5, s3);
 
 assign s8[0] = s0;
 assign s8[1] = s4;
 assign s8[2] = s6;
 assign s8[3] = s7;
endmodule // fullmultiplier

// ---------------------
// -- test
// ---------------------

module test;
 reg [1:0]a,b;             
 wire [3:0] s0;
          // instancia
 fullmultiplier FM1 (s0, a, b);//-- 

 initial begin:start
      a=2'b00; b=2'b00;
 end

          // parte principal
 initial begin:main
      $display("Guia_05_03 - Alan Diniz Nogueira Machado - 405782");
      $display("Test Full-Multiplier 2bits");
      $display("\n a  *  b  = result\n");
      $monitor("%2b * %2b =  %4b", a, b, s0);
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