// ---------------------------------------
// Guia 01 Ex7	 - xnor 
// Nome:Álvaro Henrique de Araújo Rungue
// Matricula: 395487
// ---------------------------------------

// ---------------------
// -- xnor gate
// ---------------------

module xnorgate (s, p, q );
 output s;
 input  p, q;

 assign s = ( p&q | ~p&~q );

endmodule // xnorgate

// ---------------------
// -- test xnor gate
// ---------------------

module testxnorgate;
 reg   a, b;
 wire  s;
          // instancia
 xnorgate XNOR1 (s, a, b  );
 
          // parte principal
 initial begin
      $display("Guia 1 Exercicio 7 - Alvaro");
      $display("Test xnor gate");
      $display("\na ~^ b  = s\n");
      a=0; b=0;
      $monitor("%b ~^ %b  = %b", a , b , s);
   #1 a=0; b=1;
   #1 a=1; b=0;
   #1 a=1; b=1;
  

 end

endmodule // testnandgate
