// ---------------------
// PUC-Minas - Instituto de Informática
// ARQ1 Guia-01 Exercicio 04 (Extra)
// Data de entrega: 01-04/02/2011
// Nome: Pedro Tronbin
// Matricula: 410473
// ---------------------

// ---------------------
// -- xor gate
// ---------------------

module xorgate (s, p, q);
 output s;
 input  p, q;

 assign s = ( (p ^ q) );

endmodule // xorgate

// ---------------------
// -- test xor gate
// ---------------------

module testxorgate;
 reg   a, b;             
 wire  s;
          // instancia
 xorgate XOR1 (s, a, b);

 initial begin:start
      a=0; b=0;
 end

          // parte principal
 initial begin:main
      $display( "Guia-01 - Pedro Tronbin - 410473" );
      $display( "Test XOR gate");
      $display( "\n( (a^b) ) = s\n");
       a=0; b=0; 
  #1  $display( "( %b ^ %b ) = %b", a, b, s);  
       a=0; b=1;
  #1  $display( "( %b ^ %b ) = %b", a, b, s);
       a=1; b=0; 
  #1  $display( "( %b ^ %b ) = %b", a, b, s);
       a=1; b=1;
  #1  $display( "( %b ^ %b ) = %b", a, b, s);
       
 end
 
endmodule // testxorgate

/* SAIDA

Guia-01 - Pedro Tronbin - 410473
    Test XOR gate
    
    ( (a^b) ) = s
    
    ( 0 ^ 0 ) = 0
    ( 0 ^ 1 ) = 1
    ( 1 ^ 0 ) = 1
    ( 1 ^ 1 ) = 0

*/