// ---------------------
// PUC-Minas - Instituto de Informática
// ARQ1 Guia-01 Exercicio 01
// Data de entrega: 01-04/02/2011
// Nome: Pedro Tronbin
// Matricula: 410473
// ---------------------

// ---------------------
// -- nand gate
// ---------------------

module nandgate (s, p, q, r);
output s;
input p, q, r; 

assign s = ( ~(p & q & r) );

endmodule // nand gate

// ---------------------
// -- test nand gate
// ---------------------

module testnandgate;
 reg a, b, c;
 wire s;
          // instancia
nandgate NAND1 (s, a, b ,c);

     // parte principal
initial begin
    $display( "Guia-01 - Pedro Tronbin - 410473" );
	 $display( "Test NAND gate" );
	 $display( "\n( ~(a&b&c) ) = s\n" );
	   a=0; b=0; c=0;
  #1  $display("~( %b & %b & %b ) = %b", a, b, c, s);
      a=0; b=0; c=1;
  #1  $display("~( %b & %b & %b ) = %b", a, b, c, s);
      a=0; b=1; c=0;
  #1  $display("~( %b & %b & %b ) = %b", a, b, c, s);
      a=0; b=1; c=1;
  #1  $display("~( %b & %b & %b ) = %b", a, b, c, s);
      a=1; b=0; c=0;
  #1  $display("~( %b & %b & %b ) = %b", a, b, c, s);
      a=1; b=0; c=1;
  #1  $display("~( %b & %b & %b ) = %b", a, b, c, s);
      a=1; b=1; c=0;
  #1  $display("~( %b & %b & %b ) = %b", a, b, c, s);
      a=1; b=1; c=1;
  #1  $display("~( %b & %b & %b ) = %b", a, b, c, s);

 end

endmodule // testnandgate

/* SAIDA

 Guia-01 - Pedro Tronbin - 410473
    Test NAND gate
    
    ( ~(a&b&c) ) = s
    
    ~( 0 & 0 & 0 ) = 1
    ~( 0 & 0 & 1 ) = 1
    ~( 0 & 1 & 0 ) = 1
    ~( 0 & 1 & 1 ) = 1
    ~( 1 & 0 & 0 ) = 1
    ~( 1 & 0 & 1 ) = 1
    ~( 1 & 1 & 0 ) = 1
    ~( 1 & 1 & 1 ) = 0

*/