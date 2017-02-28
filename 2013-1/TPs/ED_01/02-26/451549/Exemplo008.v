// ----------------------------------------------------------------------
// Exemplo 0008 - XNOR
// Débora Deslandes de Almeida Batista
// Matricula : 451549
// ----------------------------------------------------------------------

// ----------------------------------------------------------------------
// -- Xnor gate
// ----------------------------------------------------------------------

module xnorgate (output s, input a,b);
	assign s = (~(a^b));
endmodule // xnorgate

// ----------------------------------------------------------------------
// -- Test XNOR gate
// ----------------------------------------------------------------------

module testxnorgate;
	
	reg a,b;
	wire s;
	
	xnorgate aguaFresca (s,a,b);
	
	initial begin : start
		a = 0;
		b = 0;
	end
	
	initial begin : main
		$display ("Exemplo 0009 - Debora Deslandes de Almeida Batista");
		$display ("Matricula : 451549");
		$display ("Test XNOR gate");
		$display ("(~(a^b)) = s");
		$monitor ("(~(%b^%b)) = %b", a,b,s);
			#1 a = 1; b = 0;
			#1 a = 0; b = 1;
			#1 a = 1; b = 1;
	end
endmodule