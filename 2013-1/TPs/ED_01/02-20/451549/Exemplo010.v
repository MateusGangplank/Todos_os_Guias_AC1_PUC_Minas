// ----------------------------------------------------------------------
// Exemplo 0010 - NOR 
// Debora Deslandes de Almeida Batista
// Matricula : 451549
// ----------------------------------------------------------------------

// ----------------------------------------------------------------------
// -- NOR gate
// ----------------------------------------------------------------------

	module norgate (output s, input a,b);
		assign s = ((~a)&(~b));
	endmodule
	
// ----------------------------------------------------------------------
// -- test NOR gate
// ----------------------------------------------------------------------

	module testnorgate;
	
	reg a,b;
	wire s;
	
	norgate estouNaPraia (s,a,b);
	
	initial begin : start
		a = 0;
		b = 0;
	end
	
	initial begin : main
		$display ("\nExemplo 0010 - Debora Deslandes de Almeida Batista");
		$display ("\nMatricula : 451549");
		$display ("\nTest NOR gate");
		$display ("\n((~a)&(~b)) = s");
		$monitor ("\n((~%b)&(~%b)) = %b" , a,b,s);
			#1 a = 1; b = 0;
			#1 a = 0; b = 1;
			#1 a = 1; b = 1;
	end
endmodule