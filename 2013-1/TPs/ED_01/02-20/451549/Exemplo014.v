// ----------------------------------------------------------------------
// Exemplo 00014 - AND
// Débra Deslandes de Almeida Batista
// Matricula : 451549
// ----------------------------------------------------------------------

// ----------------------------------------------------------------------
// -- AND gate
// ----------------------------------------------------------------------

	module AND2 (output saida, input e,i);
		assign saida = (e&i);
	endmodule
// ----------------------------------------------------------------------
	module andgate (output s, input a,b,c);
		assign s = ((a&b)&c);
	endmodule
	
// ----------------------------------------------------------------------
// -- test AND gate
// ----------------------------------------------------------------------

	module testandgate;
	
	reg a, b, c;
	
	wire s1;
	
	AND2 aguaDeCoc01 (s1,a,b);
	AND2 aguaDeCoco2 (s,c,s1);
	
	initial begin : start
		a = 0;
		b = 0;
		c = 0;
	end
	
	initial begin : main
			$display ("\nExemplo 0014 - Debora Deslandes de Almeida Batista");
			$display ("\nMatricula : 451549");
			$display ("\nTest AND gate");
			$display ("\n((a&b)&c) = s");
			$monitor ("\n((%b&%b)&%b) = %b" , a,b,c,s);
				#1 a = 0; b = 0; c = 1;
				#1 a = 0; b = 1; c = 0;
				#1 a = 0; b = 1; c = 1;
				#1 a = 1; b = 0; c = 0;
				#1 a = 1; b = 0; c = 1;
				#1 a = 1; b = 1; c = 0;
				#1 a = 1; b = 1; c = 1;
		end
endmodule