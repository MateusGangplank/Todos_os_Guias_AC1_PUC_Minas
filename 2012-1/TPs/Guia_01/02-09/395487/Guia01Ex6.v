// ---------------------------------------
// Guia 01 Ex6	 - xor 
// Nome:Álvaro Henrique de Araújo Rungue
// Matricula: 395487
// ---------------------------------------

// ---------------------
// -- xor gate
// ---------------------

module xorgate (s, p, q );
 output s;
 input  p, q;

 assign s = ( ~p&q | p&~q );

endmodule // xorgate

// ---------------------
// -- test xor gate
// ---------------------

module testxorgate;
 reg   a, b;
 wire  s;
          // instancia
 xorgate XOR1 (s, a, b  );
 
          // parte principal
 initial begin
      $display("Guia 1 Exercicio 6 - Alvaro");
      $display("Test xor gate");
      $display("\na ^ b  = s\n");
      a=0; b=0;
      $monitor("%b ^ %b  = %b", a , b , s);
   #1 a=0; b=1;
   #1 a=1; b=0;
   #1 a=1; b=1;
  

 end

endmodule // testnandgate
