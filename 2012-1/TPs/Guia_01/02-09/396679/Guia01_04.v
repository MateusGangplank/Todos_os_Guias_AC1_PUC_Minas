// ---------------------
// Guia01_04 - NAND usando De Morgan
// Nome: Bruno Cezar Andrade Viallet
// Matricula: 396679
// ---------------------

// ---------------------
// -- NAND gate
// ---------------------

module nandgate (s, p, q);
 output s;
 input  p, q;
 
 assign s = (~p | ~q); // -- AND usando De Morgan = ~(~p | ~q) como Nand = ~(And) temos (~p | ~q)
 
endmodule // nandgate 

// ---------------------
// -- test nand gate
// ---------------------

module testnandgate;
 reg   a, b;
 wire  s;
          // instancia
 nandgate NAND1 (s, a, b);
          // parte principal
 initial begin:start
      a=0; b=0; 
      $display("Guia01_04 - Bruno Cezar Andrade Viallet - 396679");
      $display("Test NAND gate usando De Morgan");
		$display("(~a|~b)= S");
		$monitor("   %b  %b = %b", a, b, s);
  	#1  a=0; b=0;
	#1  a=0; b=1;
	#1  a=0; b=1;
	#1  a=1; b=0;
	#1  a=1; b=0;
	#1  a=1; b=1;
	#1  a=1; b=1;
 end

endmodule // testnandgate