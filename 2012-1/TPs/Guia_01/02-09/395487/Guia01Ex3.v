// ---------------------------------------
// Guia 01 Ex3 - XNOR
// Nome:Álvaro Henrique de Araújo Rungue
// Matricula: 395487
// ---------------------------------------

// ---------------------
// -- xnor gate
// ---------------------

module xnorgate (s, p, q );
 output s;
 input  p, q ;

 assign s = ~(p  ^ q );

endmodule // xnorgate

// ---------------------
// -- test xnor gate
// ---------------------

module testxnorgate;
 reg   a, b;
 wire  s;
          // instancia
 xnorgate XNOR1 (s, a, b );
 
          // parte principal
 
  initial begin:start 
a=0; b=0;
end 


 initial begin:main 
       $display("Guia 1 Exercicio 3 - Alvaro");
      $display("Test XNOR gate");
      $display("\na ~^ b   = s\n");
  
 $monitor("%b %b = %b" ,  a , b , s);     
      #1 a=0; b=1;
      #1 a=1; b=0;
      #1 a=1; b=1;
 
 end

endmodule // testnorgate