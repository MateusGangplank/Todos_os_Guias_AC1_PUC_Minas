// ---------------------
// Guia 02 - Exercicio 01 - OR
// Nome: Paulo Ricardo Bastos de Souza
// Matricula: 405828
// ---------------------

// ---------------------
// -- or gate
// ---------------------

module orgate (s, p, q);
 output s;
 input  p, q;
 wire temp1, temp2;
 
 nand NAND1 (temp1, p);
 nand NAND2 (temp2, q);
 
 assign s = ~(temp1 & temp2);

endmodule // orgate

// ---------------------
// -- test orgate
// ---------------------

module testorgate;
 reg   a, b;
 wire  s;
          // instancia
 orgate OR1 (s, a, b);

 initial begin:start
      a=0; b=0;
 end

          // parte principal
 initial begin:main
      $display("Guia 02 - Exercicio 01 - Paulo Ricardo Bastos de Souza - 405828");
      $display("Test or gate");
      $display("\na | b= s\n");
      $monitor("%b | %b = %b", a, b, s);
  #1 a=0; b=1; 
  #1 a=1; b=0; 
  #1 a=1; b=1; 
 end

endmodule // orgate