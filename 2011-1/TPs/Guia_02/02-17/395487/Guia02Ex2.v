// ---------------------
// Guia 02 Ex2 - And
// Nome:Álvaro Henrique de Araújo Rungue
// Matricula: 395487
// ---------------------

// ---------------------
// -- nor gate 2 variavei
// ---------------------

module norgate1 (s, p, q);
 output s;
 input  p, q;
 
 assign s = ~( p | q);

endmodule // norgate


// ---------------------
// -- nor gate
// ---------------------

module norgate (s, p, q , r);
 output s;
 input  p, q , r;
 
 assign s = ~( p | q | r );

endmodule // norgate

// -----------------------------------------
// -- and gate utilizando combinacoes nor
// -----------------------------------------

module andgate (s0, p, q , r);
 output s0;
 wire s1,  s2 , s3;
 input  p, q , r;
 
 norgate NOR1 (s1,p,p,p);
 norgate NOR2 (s2,q,q ,q);
 norgate NOR3 (s3,r,r ,r);
 norgate NOR4 (s0,s1,s2,s3);

endmodule // andgate 


// ---------------------
// -- test or gate
// ---------------------

module testgandate;
 reg   a, b , c ;
 wire  s;
          // instancia
 andgate AND1 (s, a, b ,c);
 
 initial begin:start
      a=0; b=0;c=0;
 end
 
          // parte principal
 initial begin
 		$display("Exemplo01 - Alvaro - 395487");
      $display("Test and gate");
      $monitor(" %b & %b  & %b = %b" , a ,b ,c ,s);
  #1  a=0; b=0; c=0;
  #1  a=0; b=0;c=1;
  #1  a=0; b=1;c=0;
  #1  a=0; b=1;c=1;
  #1  a=1; b=0;c=0;
  #1  a=1; b=0;c=1;
  #1  a=1; b=1;c=0;
  #1  a=1; b=1;c=1;  
 end

endmodule // testnandgate
