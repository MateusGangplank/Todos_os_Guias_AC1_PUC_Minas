// ---------------------
// PUC-Minas - Instituto de Informática
// ARQ1 Guia-01 Exercicio 03
// Data de entrega: 01-04/02/2011
// Nome: Pedro Tronbin
// Matricula: 410473
// ---------------------

// ---------------------
// -- xnor gate
// ---------------------

module xnorgate (s, p, q, r, t);
 output s;
 input  p, q, r, t;

 assign s = ( ~(p ^ q ^ r ^ t) );

endmodule // xnorgate

// ---------------------
// -- test xnor gate
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
      $display( "Guia-01 - Pedro Tronbin - 410473" );
      $display( "Test XNOR gate");
      $display( "\n( ~(a^b^c^d) ) = s\n");
      a=0; b=0; c=0; d=0;
  #1  $display( "~( %b ^ %b ^ %b ^ %b ) = %b", a, b, c, d, s);  
      a=0; b=0; c=0; d=1;
  #1  $display( "~( %b ^ %b ^ %b ^ %b ) = %b", a, b, c, d, s);
      a=0; b=0; c=1; d=0;
  #1  $display( "~( %b ^ %b ^ %b ^ %b ) = %b", a, b, c, d, s);
      a=0; b=0; c=1; d=1;
  #1  $display( "~( %b ^ %b ^ %b ^ %b ) = %b", a, b, c, d, s);
      a=0; b=1; c=0; d=0;
  #1  $display( "~( %b ^ %b ^ %b ^ %b ) = %b", a, b, c, d, s);
      a=0; b=1; c=0; d=1;
  #1  $display( "~( %b ^ %b ^ %b ^ %b ) = %b", a, b, c, d, s);
      a=0; b=1; c=1; d=0;
  #1  $display( "~( %b ^ %b ^ %b ^ %b ) = %b", a, b, c, d, s);
      a=0; b=1; c=1; d=1;
  #1  $display( "~( %b ^ %b ^ %b ^ %b ) = %b", a, b, c, d, s);
      a=1; b=0; c=0; d=0;
  #1  $display( "~( %b ^ %b ^ %b ^ %b ) = %b", a, b, c, d, s);	
		a=1; b=0; c=0; d=1;
  #1  $display( "~( %b ^ %b ^ %b ^ %b ) = %b", a, b, c, d, s);	
		a=1; b=0; c=1; d=0;
  #1  $display( "~( %b ^ %b ^ %b ^ %b ) = %b", a, b, c, d, s);
		a=1; b=0; c=1; d=1;
  #1  $display( "~( %b ^ %b ^ %b ^ %b ) = %b", a, b, c, d, s);
		a=1; b=1; c=0; d=0;
  #1  $display( "~( %b ^ %b ^ %b ^ %b ) = %b", a, b, c, d, s);
		a=1; b=1; c=0; d=1;
  #1  $display( "~( %b ^ %b ^ %b ^ %b ) = %b", a, b, c, d, s);
		a=1; b=1; c=1; d=0;
  #1  $display( "~( %b ^ %b ^ %b ^ %b ) = %b", a, b, c, d, s);		
		a=1; b=1; c=1; d=1;
  #1  $display( "~( %b ^ %b ^ %b ^ %b ) = %b", a, b, c, d, s);
  		
 end
 
endmodule // testorgate

/* SAIDA

Guia-01 - Pedro Tronbin - 410473
    Test XNOR gate
    
    ( ~(a^b^c^d) ) = s
    
    ~( 0 ^ 0 ^ 0 ^ 0 ) = 1
    ~( 0 ^ 0 ^ 0 ^ 1 ) = 0
    ~( 0 ^ 0 ^ 1 ^ 0 ) = 0
    ~( 0 ^ 0 ^ 1 ^ 1 ) = 1
    ~( 0 ^ 1 ^ 0 ^ 0 ) = 0
    ~( 0 ^ 1 ^ 0 ^ 1 ) = 1
    ~( 0 ^ 1 ^ 1 ^ 0 ) = 1
    ~( 0 ^ 1 ^ 1 ^ 1 ) = 0
    ~( 1 ^ 0 ^ 0 ^ 0 ) = 0
    ~( 1 ^ 0 ^ 0 ^ 1 ) = 1
    ~( 1 ^ 0 ^ 1 ^ 0 ) = 1
    ~( 1 ^ 0 ^ 1 ^ 1 ) = 0
    ~( 1 ^ 1 ^ 0 ^ 0 ) = 1
    ~( 1 ^ 1 ^ 0 ^ 1 ) = 0
    ~( 1 ^ 1 ^ 1 ^ 0 ) = 0
    ~( 1 ^ 1 ^ 1 ^ 1 ) = 1
*/