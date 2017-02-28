// ---------------------
// Nome:Silvino Henrique Santos de Souza	
// Matricula: 412773
// ---------------------

// ---------------------
// -- XNOR gate
// ---------------------

module xnorgate (s, p, q, r, t);
 output s;
 input  p, q, r,t;

 assign s = (~(p ^ q ^ r ^t));

endmodule // xnorgate

// ---------------------
// -- test xnor gate
// ---------------------

module testxnorgate;
 reg   a, b, c, d;
 wire  s;
          // instancia
 xnorgate XNOR1 (s, a, b, c, d);
 
          // parte principal
 initial begin
      $display("Guia 1 - Silvino Henrique Santos de Souza - 412773");
      $display("Test XNOR gate");
      $display("\n(~(a ^ b ^ c ^ d)) = s\n");
      a=0; b=0;c=0;d=0;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
      a=0; b=0;c=0;d=1;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
  		a=0; b=0;c=1;d=0;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
      a=0; b=0;c=1;d=1;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
  		a=0; b=1;c=0;d=0;		
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
  		a=0; b=1;c=0;d=1;	
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
  		a=0; b=1;c=1;d=0;	
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
  		a=0; b=1;c=1;d=1;	
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
  		a=1; b=0;c=0;d=0;	
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
  		a=1; b=0;c=0;d=1;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
  		a=1; b=0;c=1;d=0;	
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
  		a=1; b=0;c=1;d=1;	
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
  		a=1; b=1;c=0;d=0;	
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
  		a=1; b=1;c=0;d=1;	
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
  		a=1; b=1;c=1;d=0;
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
  		a=1; b=1;c=1;d=1;	
  #1  $display("~(%b ^ %b ^ %b ^ %b) = %b", a, b, c, d, s);
  		a=1; b=1;c=1;d=1;																	


 end

endmodule // testnorgate


/*Teste
Guia 1 - Silvino Henrique Santos de Souza - 412773
    Test XNOR gate
    
    (~(a ^ b ^ c ^ d)) = s
    
    ~(0 ^ 0 ^ 0 ^ 0) = 1
    ~(0 ^ 0 ^ 0 ^ 1) = 0
    ~(0 ^ 0 ^ 1 ^ 0) = 0
    ~(0 ^ 0 ^ 1 ^ 1) = 1
    ~(0 ^ 1 ^ 0 ^ 0) = 0
    ~(0 ^ 1 ^ 0 ^ 1) = 1
    ~(0 ^ 1 ^ 1 ^ 0) = 1
    ~(0 ^ 1 ^ 1 ^ 1) = 0
    ~(1 ^ 0 ^ 0 ^ 0) = 0
    ~(1 ^ 0 ^ 0 ^ 1) = 1
    ~(1 ^ 0 ^ 1 ^ 0) = 1
    ~(1 ^ 0 ^ 1 ^ 1) = 0
    ~(1 ^ 1 ^ 0 ^ 0) = 1
    ~(1 ^ 1 ^ 0 ^ 1) = 0
    ~(1 ^ 1 ^ 1 ^ 0) = 0
    ~(1 ^ 1 ^ 1 ^ 1) = 1*/