// ---------------------------
// Guia_08_01 - min( 2, 3, 6, 7, 10, 11, 12, 14 )
// Nome: Alan Diniz Nogueira Machado
// Matricula: 405782
// Objetivo: Utilizar a linguagem Verilog
// 	para implementar um método para a construir um circuito pelos mintermos ( 2, 3, 6, 7, 10, 11, 12, 14 ).
// Teste:
//| a | b | c | d | S |
//+---+---+---+---+---+
//| 0 | 0 | 0 | 0 | 0 |
//| 0 | 0 | 0 | 1 | 0 |
//| 0 | 0 | 1 | 0 | 1 |
//| 0 | 0 | 1 | 1 | 1 |
//| 0 | 1 | 0 | 0 | 0 |
//| 0 | 1 | 0 | 1 | 0 |
//| 0 | 1 | 1 | 0 | 1 |
//| 0 | 1 | 1 | 1 | 1 |
//| 1 | 0 | 0 | 0 | 0 |
//| 1 | 0 | 0 | 1 | 0 |
//| 1 | 0 | 1 | 0 | 1 |
//| 1 | 0 | 1 | 1 | 1 |
//| 1 | 1 | 0 | 0 | 1 |
//| 1 | 1 | 0 | 1 | 0 |
//| 1 | 1 | 1 | 0 | 1 |
//| 1 | 1 | 1 | 1 | 0 |
//----------------------------

// ---------------------
// --  circuit
// ---------------------

module circuit (s0, a, b, c, d);
 output s0, na, nb, nd, a1, a2, a3, a4;
 input  a, b, c, d;

 not NOT1(nd, d);
 not NOT2(nb, b);
 not NOT3(na, a);
  
 and AND1(a1, na, c);
 and AND2(a2, nb, c);
 and AND3(a3, nd, c); 
 and AND4(a4, a, b, nd);  
 
 or OR1(s0, a1, a2, a3, a4);
endmodule // circuit

// ---------------------
// -- test
// ---------------------

module test;
 reg  a, b, c, d;             
 wire s0;
          // instancia
 circuit C1 (s0, a, b, c, d);

 initial begin:start
      a=0; b=0; c=0; d=0;
 end

          // parte principal
 initial begin:main
      $display("Guia_08_01 - Alan Diniz Nogueira Machado - 405782");
      $display("Test Circuito min( 2, 3, 6, 7, 10, 11, 12, 14 )");
      $display("\n| a | b | c | d | S |\n");
      $monitor("| %b | %b | %b | %b | %b |", a, b, c, d, s0);
  #1  a=0; b=0; c=0; d=1;
  #1  a=0; b=0; c=1; d=0;
  #1  a=0; b=0; c=1; d=1;
  #1  a=0; b=1; c=0; d=0;
  #1  a=0; b=1; c=0; d=1;
  #1  a=0; b=1; c=1; d=0;
  #1  a=0; b=1; c=1; d=1;
  #1  a=1; b=0; c=0; d=0;
  #1  a=1; b=0; c=0; d=1;
  #1  a=1; b=0; c=1; d=0;
  #1  a=1; b=0; c=1; d=1;
  #1  a=1; b=1; c=0; d=0;
  #1  a=1; b=1; c=0; d=1;
  #1  a=1; b=1; c=1; d=0;
  #1  a=1; b=1; c=1; d=1;
 end

endmodule // test