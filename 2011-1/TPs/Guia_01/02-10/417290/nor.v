 // -------------------------------
// Guia 01_02 - NOR
// Nome: Ludmily Caldeira da Silva
// Matricula: 417290
// --------------------------------

// ----------------------------
// -- NOR gate Tres entradas
// ----------------------------

 module norgate (s, p, q, r);
 output s;
 input  p, q, r;

 assign s = ~(p | q | r);

endmodule // norgate

// ---------------------
// -- test NOR gate
// ---------------------

module testnorgate;
 reg   a, b, c;
 wire  s;
          // instancia
 norgate NOR1 (s, a, b, c);
 
          // parte principal
 initial begin
      $display("\nguia01_02 - Ludmily Caldeira da Silva - 417290\n");
      $display("Test NOR gate");
      $display("\n~(a | b | c) = s\n");
      a=0; b=0; c=0;
  #1  $display("~(%b | %b | %b) = %b", a, b, c, s);
      a=0; b=0; c=1;
  #1  $display("~(%b | %b | %b) = %b", a, b, c, s);
      a=0; b=1; c=0;
  #1  $display("~(%b | %b | %b) = %b", a, b, c, s);
      a=0; b=1; c=1;
  #1  $display("~(%b | %b | %b) = %b", a, b, c, s);
  	   a=1; b=0; c=0;
  #1  $display("~(%b | %b | %b) = %b", a, b, c, s);
      a=1; b=0; c=1;
  #1  $display("~(%b | %b | %b) = %b", a, b, c, s);
      a=1; b=1; c=0;
  #1  $display("~(%b | %b | %b) = %b", a, b, c, s);
      a=1; b=1; c=1;
  #1  $display("~(%b | %b | %b) = %b", a, b, c, s);

 end
 
endmodule // testnordgate

/*
RESULTADOS OBTIDOS

     ----jGRASP exec: vvp nor.vvp
    
    
    guia01_02 - Ludmily Caldeira da Silva - 417290
    
    Test NOR gate
    
    ~(a | b | c) = s
    
    ~(0 | 0 | 0) = 1
    ~(0 | 0 | 1) = 0
    ~(0 | 1 | 0) = 0
    ~(0 | 1 | 1) = 0
    ~(1 | 0 | 0) = 0
    ~(1 | 0 | 1) = 0
    ~(1 | 1 | 0) = 0
    ~(1 | 1 | 1) = 0
    
     ----jGRASP: operation complete.
 
*/


