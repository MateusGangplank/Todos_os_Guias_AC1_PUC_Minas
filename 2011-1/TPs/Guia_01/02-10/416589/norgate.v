// ---------------------
// Guia 01_02 - NOR
// Nome: Alyson Deives
// Matricula: 416589
// ---------------------

// ---------------------
// -- nor gate
// ---------------------

module norgate (s, p, q, r);
 output s;
 input  p, q, r;

 assign s = ~(p | q | r);

endmodule // norgate

// ---------------------
// -- test nor gate
// ---------------------

module testnorgate;
 reg   a, b, c;
 wire  s;
          // instancia
 norgate NOR1 (s, a, b, c);
 
          // parte principal
 initial begin
      $display("Guia 01_02 - Alyson Deives - 416589");
      $display("Test NOR gate");
      $display("\na | b | c = s\n");
      a=0; b=0;c=0;
  #1  $display("~(%b | %b | %b) = %b", a, b, c, s);
      a=0; b=0;c=1;
  #1  $display("~(%b | %b | %b) = %b", a, b, c, s);
		a=0; b=1;c=0;
  #1  $display("~(%b | %b | %b) = %b", a, b, c, s);
		a=0; b=1;c=1;
  #1  $display("~(%b | %b | %b) = %b", a, b, c, s);
		a=1; b=0;c=0;
  #1  $display("~(%b | %b | %b) = %b", a, b, c, s);
		a=1; b=0;c=1;
  #1  $display("~(%b | %b | %b) = %b", a, b, c, s);
		a=1; b=1;c=0;
  #1  $display("~(%b | %b | %b) = %b", a, b, c, s);
		a=1; b=1;c=1;
  #1  $display("~(%b | %b | %b) = %b", a, b, c, s);
end

endmodule // testnorgate
