// ---------------------
// Guia01_02 - NOR
// Nome: Bruno Cezar Andrade Viallet
// Matricula: 396679
// ---------------------

// ---------------------
// -- nor gate
// ---------------------

module norgate (s, p, q);
 output s;
 input  p, q;

 assign s = ~(p | q);

endmodule // norgate

// ---------------------
// -- test nor gate
// ---------------------

module testnorgate;
 reg   a, b;
 wire  s;
          // instancia
 norgate NOR1 (s, a, b);
          // parte principal
 initial begin:start
      a=0; b=0;     
      $display("Guia01_02 - Bruno Cezar Andrade Viallet - 396679");
      $display("Test NOR gate");
		$monitor("%b | %b = %b", a, b, s);
  #1  a=0; b=1;
  #1  a=1; b=0;
  #1  a=1; b=1;
 end

endmodule // testnorgate