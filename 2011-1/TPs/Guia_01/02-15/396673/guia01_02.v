// ---------------------
// Guia 01_02 - NOR
// Nome: Anderson Belchior de Carvalho
// Matricula: 396673
// ---------------------

// ---------------------
// -- nor gate
// ---------------------

module norgate (s0, p, q, r);
 output s0;
 input  p, q, r;

 assign s0 = ~(p | q | r);

endmodule // norgate


// --------------------------
// -- test norgate
// --------------------------

module testnorgate;
 reg   a, b, c;             
 wire  s;
          // instancia
 norgate NOR1 (s, a, b, c);

          // parte principal
 initial begin:main
      $display("Guia 01_02 - Anderson Belchior de Carvalho - 396673");
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

endmodule // testnorgate
