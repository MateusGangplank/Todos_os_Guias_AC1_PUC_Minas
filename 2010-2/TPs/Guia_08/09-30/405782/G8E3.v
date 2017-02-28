// ---------------------------
// Guia_08_03
// Nome: Alan Diniz Nogueira Machado
// Matricula: 405782
// Objetivo: Utilizar a linguagem Verilog
// 	para implementar um método para a construir um circuito com os mintermos da tabela baixo:
// Teste:
//| a | b | c | d | e | S |
//+---+---+---+---+---+---+
//| 0 | 0 | 0 | 0 | 0 | 1 |
//| 0 | 0 | 0 | 0 | 1 | 1 |
//| 0 | 0 | 0 | 1 | 0 | 0 |
//| 0 | 0 | 0 | 1 | 1 | 0 |
//| 0 | 0 | 1 | 0 | 0 | 1 |
//| 0 | 0 | 1 | 0 | 1 | 1 |
//| 0 | 0 | 1 | 1 | 0 | 0 |
//| 0 | 0 | 1 | 1 | 1 | 1 |
//| 0 | 1 | 0 | 0 | 0 | 1 |
//| 0 | 1 | 0 | 0 | 1 | 1 |
//| 0 | 1 | 0 | 1 | 0 | 0 |
//| 0 | 1 | 0 | 1 | 1 | 0 |
//| 0 | 1 | 1 | 0 | 0 | 0 |
//| 0 | 1 | 1 | 0 | 1 | 1 |
//| 0 | 1 | 1 | 1 | 0 | 1 |
//| 0 | 1 | 1 | 1 | 1 | 1 |
//| 1 | 0 | 0 | 0 | 0 | 0 |
//| 1 | 0 | 0 | 0 | 1 | 1 |
//| 1 | 0 | 0 | 1 | 0 | 1 |
//| 1 | 0 | 0 | 1 | 1 | 0 |
//| 1 | 0 | 1 | 0 | 0 | 1 |
//| 1 | 0 | 1 | 0 | 1 | 1 |
//| 1 | 0 | 1 | 1 | 0 | 0 |
//| 1 | 0 | 1 | 1 | 1 | 1 |
//| 1 | 1 | 0 | 0 | 0 | 0 |
//| 1 | 1 | 0 | 0 | 1 | 0 |
//| 1 | 1 | 0 | 1 | 0 | 0 |
//| 1 | 1 | 0 | 1 | 1 | 1 |
//| 1 | 1 | 1 | 0 | 0 | 0 |
//| 1 | 1 | 1 | 0 | 1 | 1 |
//| 1 | 1 | 1 | 1 | 0 | 1 |
//| 1 | 1 | 1 | 1 | 1 | 1 |
//----------------------------

// ---------------------
// --  circuit
// ---------------------

module circuit (s0, a, b, c, d, e);
 output s0, na, nb, nc, nd, ne, a1, a2, a3, a4, a5, a6, a7, a8, a9;
 input  a, b, c, d, e;

 not NOT1(nd, d);
 not NOT2(nb, b);
 not NOT3(na, a);
 not NOT4(nc, c);
 not NOT5(ne, e);
  
 and AND1(a1, c, e);
 and AND2(a2, na, nc, nd);
 and AND3(a3, na, nb, nd); 
 and AND4(a4, nb, nd, c);
 and AND5(a5, b, c, d);
 and AND6(a6, nb, e, nd);
 and AND7(a7, na, nd, e);  
 and AND8(a8, a, b, d, e);  
 and AND9(a9, a, nb, nc, d, ne);        
 
 or OR1(s0, a1, a2, a3, a4, a5, a6, a7, a8, a9);
endmodule // circuit

// ---------------------
// -- test
// ---------------------

module test;
 reg  a, b, c, d, e;             
 wire s0;
          // instancia
 circuit C1 (s0, a, b, c, d, e);

 initial begin:start
     a=0; b=0; c=0; d=0; e=0;
 end

          // parte principal
 initial begin:main
      $display("Guia_08_03 - Alan Diniz Nogueira Machado - 405782");
      $display("Test circuito");
      $display("\n| a | b | c | d | e | S |\n");
      $monitor("| %b | %b | %b | %b | %b | %b |", a, b, c, d, e, s0);
  #1 a=0; b=0; c=0; d=0; e=1;
  #1 a=0; b=0; c=0; d=1; e=0;
  #1 a=0; b=0; c=0; d=1; e=1;
  #1 a=0; b=0; c=1; d=0; e=0;
  #1 a=0; b=0; c=1; d=0; e=1;
  #1 a=0; b=0; c=1; d=1; e=0;
  #1 a=0; b=0; c=1; d=1; e=1;
  #1 a=0; b=1; c=0; d=0; e=0;
  #1 a=0; b=1; c=0; d=0; e=1;
  #1 a=0; b=1; c=0; d=1; e=0;
  #1 a=0; b=1; c=0; d=1; e=1;
  #1 a=0; b=1; c=1; d=0; e=0;
  #1 a=0; b=1; c=1; d=0; e=1;
  #1 a=0; b=1; c=1; d=1; e=0;
  #1 a=0; b=1; c=1; d=1; e=1;
  #1 a=1; b=0; c=0; d=0; e=0;
  #1 a=1; b=0; c=0; d=0; e=1;
  #1 a=1; b=0; c=0; d=1; e=0;
  #1 a=1; b=0; c=0; d=1; e=1;
  #1 a=1; b=0; c=1; d=0; e=0;
  #1 a=1; b=0; c=1; d=0; e=1;
  #1 a=1; b=0; c=1; d=1; e=0;
  #1 a=1; b=0; c=1; d=1; e=1;
  #1 a=1; b=1; c=0; d=0; e=0;
  #1 a=1; b=1; c=0; d=0; e=1;
  #1 a=1; b=1; c=0; d=1; e=0;
  #1 a=1; b=1; c=0; d=1; e=1;
  #1 a=1; b=1; c=1; d=0; e=0;
  #1 a=1; b=1; c=1; d=0; e=1;
  #1 a=1; b=1; c=1; d=1; e=0;
  #1 a=1; b=1; c=1; d=1; e=1;
 end

endmodule // test