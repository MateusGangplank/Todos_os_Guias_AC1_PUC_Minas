// ---------------------------
// Guia_08_02 - min( 0, 2, 4, 8, 9, 11, 13 )
// Nome: Alan Diniz Nogueira Machado
// Matricula: 405782
// Objetivo: Utilizar a linguagem Verilog
// 	para implementar um método para a construir um circuito pelos mintermos ( 0, 2, 4, 8, 9, 11, 13 ).
// Teste:
//| a | b | c | d | S |
//+---+---+---+---+---+
//| 0 | 0 | 0 | 0 | 1 |
//| 0 | 0 | 0 | 1 | 0 |
//| 0 | 0 | 1 | 0 | 1 |
//| 0 | 0 | 1 | 1 | 0 |
//| 0 | 1 | 0 | 0 | 1 |
//| 0 | 1 | 0 | 1 | 0 |
//| 0 | 1 | 1 | 0 | 0 |
//| 0 | 1 | 1 | 1 | 0 |
//| 1 | 0 | 0 | 0 | 1 |
//| 1 | 0 | 0 | 1 | 1 |
//| 1 | 0 | 1 | 0 | 0 |
//| 1 | 0 | 1 | 1 | 1 |
//| 1 | 1 | 0 | 0 | 0 |
//| 1 | 1 | 0 | 1 | 1 |
//| 1 | 1 | 1 | 0 | 0 |
//| 1 | 1 | 1 | 1 | 0 |
//----------------------------

// ---------------------
// --  circuit
// ---------------------

module circuit (s0, a, b, c, d);
 output s0, na, nb, nc, nd, a1, a2, a3, a4, a5, a6;
 input  a, b, c, d;

 not NOT1(nd, d);
 not NOT2(nb, b);
 not NOT3(na, a);
 not NOT4(nc, c);
  
 and AND1(a1, nb, nc, nd);
 and AND2(a2, nc, na, nd);
 and AND3(a3, na, nb, nd); 
 and AND4(a4, a, nb, nc);
 and AND5(a5, a, nc, d);
 and AND6(a6, a, nb, d);      
 
 or OR1(s0, a1, a2, a3, a4, a5, a6);
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
      $display("Guia_08_02 - Alan Diniz Nogueira Machado - 405782");
      $display("Test circuito min( 0, 2, 4, 8, 9, 11, 13 )");
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