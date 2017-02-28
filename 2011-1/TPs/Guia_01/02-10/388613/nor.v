// ---------------------
// Guia 01 - NOR
// Nome: Marden Santos Batista
// Matricula: 388613
// ---------------------

// ---------------------
// -- NOR gate
// ---------------------

module norgate (s, p, q, t);
 output s;
 input  p, q, t;

 assign s = ~(p | q | t);

endmodule // nordgate

// ---------------------
// -- test norgate
// ---------------------

module testnorgate;
 reg   a, b,c;
 wire  s;
          // instancia
 norgate NOR1 (s, a, b,c);
 
          // parte principal
 initial begin
      $display("Guia 01 - Marden Santos Batista - 388613");
      $display("Test NOR gate");
      $display("\n ~(a nor b nor c) = s\n");
      a=0; b=0;c=0;
  #1  $display("%b nor %b nor %b = %b", a, b,c, s);
      a=0; b=0;c=1;
  #1  $display("%b nor %b nor %b = %b", a, b,c, s);
      a=0; b=1;c=1;
  #1  $display("%b nor %b nor %b = %b", a, b,c, s);
      a=1; b=1;c=1;
  #1  $display("%b nor %b nor %b = %b", a, b,c, s);
      a=1; b=1;c=0;
  #1  $display("%b nor %b nor %b = %b", a, b,c, s);
      a=1; b=0;c=0;
  #1  $display("%b nor %b nor %b = %b", a, b,c, s);
      a=1; b=0;c=1;
  #1  $display("%b nor %b nor %b = %b", a, b,c, s);

 end

endmodule // testnorgate
