// ----------------------------------------------------------------------
// Exemplo 0011 - XOR
// Debora Deslandes de Almeida Batista
// Matricula : 451549
// ----------------------------------------------------------------------

// ----------------------------------------------------------------------
// -- XOR gate
// ----------------------------------------------------------------------

	module xorgate (output s, input a,input b);
		assign s = (~a&b) + (a&~b);
	endmodule
	
// ----------------------------------------------------------------------
// -- Test XOR gate
// ----------------------------------------------------------------------

	module testxorgate;
	
	reg a,b;
	wire s;
	
	xorgate areia (s,a,b);
	
	initial begin : start
		a = 0;
		b = 0;
	end
	
	initial begin : main
		$display ("\nExemplo 0011 - Debora Deslandes de Almeida Batista");
		$display ("\nMatricula : 451549");
		$display ("\nTest XOR gate");
		$display ("\n((~a)(b)+ (a)(~b)) = s");
		$monitor ("\n((~%b)(%b)+ (%b)(~%b)) = %b" , a,b,a,b,s);
			#1 a = 1; b = 0;
			#1 a = 0; b = 1;
			#1 a = 1; b = 1;
	end
endmodule