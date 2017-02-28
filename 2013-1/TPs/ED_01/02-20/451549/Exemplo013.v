// ----------------------------------------------------------------------
// Exemplo 0013 - AND
// Debora Deslandes de Almeida Batista
// Matricula : 451549
// ----------------------------------------------------------------------

// ----------------------------------------------------------------------
// -- AND gate
// ----------------------------------------------------------------------

	module andgate (output s, input a,b,c);
		assign s = (a&b&c);
	endmodule
	
// ----------------------------------------------------------------------
// -- test AND gate
// ----------------------------------------------------------------------

	module testandgate;
		reg a, b, c;
		wire s;
		
		andgate gripe (s,a,b,c);
		
		initial begin : start
			a = 0;
			b = 0;
			c = 0;
		end
		
		initial begin : main
			$display ("\nExemplo 0013 - Debora Deslandes de Almeida Batista");
			$display ("\nMatricula : 451549");
			$display ("\nTest AND gate");
			$display ("\n(a&b&c) = s");
			$monitor ("\n(%b&%b&%b) = %b" , a,b,c,s);
				#1 a = 0; b = 0; c = 1;
				#1 a = 0; b = 1; c = 0;
				#1 a = 0; b = 1; c = 1;
				#1 a = 1; b = 0; c = 0;
				#1 a = 1; b = 0; c = 1;
				#1 a = 1; b = 1; c = 0;
				#1 a = 1; b = 1; c = 1;
		end
	endmodule //testandgate
