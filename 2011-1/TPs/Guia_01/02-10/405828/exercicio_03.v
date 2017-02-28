// ---------------------
// Guia 01 - Exercicio 03 - XNOR
// Nome: Paulo Ricardo Bastos de Souza
// Matricula: 405828
// ---------------------

// ---------------------
// -- xnor gate
// ---------------------

module xnorgate (s, p, q, r, t);
 output s;
 input  p, q, r, t;
 wire temp1, temp2, temp3;
 
 xor XOR1 (temp1, p, q);
 xor XOR2 (temp2, temp1, r);
 xor XOR3 (temp3, temp2, t);

 assign s = ~temp3;

endmodule // xnorgate

// ---------------------
// -- test xnorgate
// ---------------------

module testxnorgate;
 reg   a, b, c, d;
 wire  s;
          // instancia
 xnorgate XNOR1 (s, a, b, c, d);

 initial begin:start
      a=0; b=0; c=0; d=0;
 end

          // parte principal
 initial begin:main
      $display("Guia 01 - Exercicio 03 - Paulo Ricardo Bastos de Souza - 405828");
      $display("Test xnor gate");
      $display("\n~(((a ^ b) ^ c) ^ d) = s\n");
      $monitor("~(((%b ^ %b) ^ %b) ^ %b) = %b", a, b, c, d, s);
  #1 a=0; b=1; c=0; d=0;
  #1 a=1; b=0; c=1; d=1;
  #1 a=1; b=1; c=1; d=1;
 end

endmodule // xnorgate