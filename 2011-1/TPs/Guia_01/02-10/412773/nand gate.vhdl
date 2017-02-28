// ---------------------
// Nome:Silvino Henrique Santos de Souza	
// Matricula: 412773
// ---------------------

// ---------------------
// -- NAND gate
// ---------------------

module nandgate (s, p, q,r);
 output s;
 input  p, q, r;

 assign s = (~(p & q & r));

endmodule // nandgate

// ---------------------
// -- test nand gate
// ---------------------

module testnandgate;
 reg   a, b, c;
 wire  s;
          // instancia
 nandgate NAND1 (s, a, b, c);
 
          // parte principal
 initial begin
      $display("Guia 1 - Silvino Henrique Santos de Souza - 412773");
      $display("Test NAND gate");
      $display("\n(~(a & b & c)) = s\n");
      a=0; b=0;c=0;
  #1  $display("~(%b & %b & %b) = %b", a, b, c, s);
      a=0; b=0;c=1;
  #1  $display("~(%b & %b & %b) = %b", a, b, c, s);
      a=0; b=1;c=0;
  #1  $display("~(%b & %b & %b) = %b", a, b, c, s);
      a=1; b=0;c=0;
  #1  $display("~(%b & %b & %b) = %b", a, b,c, s);
	  	a=1; b=1;c=0;
  #1  $display("~(%b & %b & %b) = %b", a, b,c, s);
 		 a=0; b=1;c=1;
  #1  $display("~(%b & %b & %b) = %b", a, b,c, s);
 		a=1; b=1;c=1;
  #1  $display("~(%b & %b & %b) = %b", a, b,c, s);



 end

endmodule // testnandgate
 
 
/*Teste
Guia 1 - Silvino Henrique Santos de Souza - 412773
    Test NAND gate
    
    (~(a & b & c)) = s
    
    ~(0 & 0 & 0) = 1
    ~(0 & 0 & 1) = 1
    ~(0 & 1 & 0) = 1
    ~(1 & 0 & 0) = 1
    ~(1 & 1 & 0) = 1
    ~(0 & 1 & 1) = 1
    ~(1 & 1 & 1) = 0*/ 
    
// OBS.: SE POSSIVEL, DEIXAR OS ARQUIVOS COM EXTENSAO .V (APENAS)
