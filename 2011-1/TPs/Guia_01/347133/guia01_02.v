// Guia 01_02 - NOR
// Nome: Henrique Carvalho Parreira
// Matricula: 347133


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
      $display("Guia 01_02 - Henrique Carvalho Parreira - 347133");
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
