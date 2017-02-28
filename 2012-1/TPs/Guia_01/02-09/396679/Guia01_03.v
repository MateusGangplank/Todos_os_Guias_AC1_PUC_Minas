// ---------------------
// Guia01_03 - XNOR
// Nome: Bruno Cezar Andrade Viallet
// Matricula: 396679
// ---------------------

// ---------------------
// -- xnor gate
// ---------------------

module xnorgate (s, p, q);
 output s;
 input  p, q;

 assign s = ~(p ^ q);

endmodule // xnorgate

// ---------------------
// -- test xnor gate
// ---------------------

module testxnorgate;
 reg   a, b;
 wire  s;
          // instancia
 xnorgate XNOR1 (s, a, b);
          // parte principal
 initial begin:start
      a=0; b=0; 
      $display("Guia01_03 - Bruno Cezar Andrade Viallet - 396679");
      $display("Test XNOR gate");
		$monitor("%b  %b = %b", a, b, s);
  	#1  a=0; b=1;
  	#1  a=1; b=0;
	#1  a=1; b=1;		
 end

endmodule // testxnorgate