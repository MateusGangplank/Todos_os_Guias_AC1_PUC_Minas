// ---------------------
// Guia 01 Ex2 - XNOR
// Nome:Álvaro Henrique de Araújo Rungue
// Matricula: 395487
// ---------------------

// ---------------------
// -- and gate
// ---------------------

module xnorgate (s, p, q ,r,t);
 output s;
 input  p, q , r ,t;

 assign s = ~(p  ^ q ^ r ^ t );

endmodule // xnorgate

// ---------------------
// -- test xnor gate
// ---------------------

module testxnorgate;
 reg   a, b , c  , d;
 wire  s;
          // instancia
 xnorgate XNOR1 (s, a, b ,c ,d);
 
          // parte principal
 initial begin
      $display("Exemplo 01_01 - xxx yyy zzz - 999999");
      $display("Test XNOR gate");
      $display("\na ^ b  ^ c ^ d = s\n");
      a=0; b=0;c=0; d=0;
  #1  $display("%b ^ %b ^ %b ^ %b = %b", a, b , c, d , s);
      a=0; b=0;c=0; d=1;
  #1  $display("%b ^ %b ^ %b ^ %b = %b", a, b, c , d , s);
      a=0; b=0;c=1; d=0;
  #1  $display("%b ^ %b ^ %b ^ %b = %b", a, b, c , d ,s);
      a=0; b=0;c=1; d=1;
  #1  $display("%b ^ %b ^ %b ^ %b = %b", a, b, c , d ,s);
 		a=0; b=1;c=0; d=0;
  #1  $display("%b ^ %b ^ %b ^ %b = %b", a, b , c, d , s);
      a=0; b=1;c=0; d=1;
  #1  $display("%b ^ %b ^ %b ^ %b = %b", a, b, c , d , s);
      a=0; b=1;c=1; d=0;
  #1  $display("%b ^ %b ^ %b ^ %b = %b", a, b, c , d ,s);
      a=0; b=1;c=1; d=1;
  #1  $display("%b ^ %b ^ %b ^ %b = %b", a, b, c , d ,s);
       a=1; b=0;c=0; d=0;
  #1  $display("%b ^ %b ^ %b ^ %b = %b", a, b , c, d , s);
      a=1; b=0;c=0; d=1;
  #1  $display("%b ^ %b ^ %b ^ %b = %b", a, b, c , d , s);
      a=1; b=0;c=1; d=0;
  #1  $display("%b ^ %b ^ %b ^ %b = %b", a, b, c , d ,s);
      a=1; b=0;c=1; d=1;
  #1  $display("%b ^ %b ^ %b ^ %b = %b", a, b, c , d ,s);
 		a=1; b=1;c=0; d=0;
  #1  $display("%b ^ %b ^ %b ^ %b = %b", a, b , c, d , s);
      a=1; b=1;c=0; d=1;
  #1  $display("%b ^ %b ^ %b ^ %b = %b", a, b, c , d , s);
      a=1; b=1;c=1; d=0;
  #1  $display("%b ^ %b ^ %b ^ %b = %b", a, b, c , d ,s);
      a=1; b=1;c=1; d=1;
  #1  $display("%b ^ %b ^ %b ^ %b = %b", a, b, c , d ,s);
 end

endmodule // testxnorgate
