// ---------------------
// Guia 01_02 - NOR
// Nome: Heitor Terozendi	
// Matricula: 396698
// ---------------------

// ---------------------
// -- nor gate
// ---------------------

module norgate (s, p, q, r);
 output s;
 input  p, q, r;

 assign s = p | q | r;

endmodule // norgate

// ---------------------
// -- test nor gate
// ---------------------

module testnorgate;
 reg   a, b, c;             
 wire  s;
          // instancia
 norgate NOR1 (s, a, b, c);

 initial begin:start
      a=0; b=0; c=0;
 end

          // parte principal
 initial begin:main
      $display("Guia 01_02 - Heitor Terozendi - 396698");
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
