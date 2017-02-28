// ----------------------------------------------------------------------
// Exemplo 0015 - OR
// Débora Deslandes de Almeida Batista
// Matricula : 451549
// ----------------------------------------------------------------------

// ----------------------------------------------------------------------
// -- OR gate
// ----------------------------------------------------------------------

	module orgate2 (output saida, input e,i);
		assign saida = (e|i);
	endmodule
	
// ----------------------------------------------------------------------

	module orgate3 (output s, input a,b,c);
		assign s = ((a|b)|c);
	endmodule
	
// ----------------------------------------------------------------------
// -- test orgate3
// ----------------------------------------------------------------------

	module testorgate3 ;
	
	reg a,b,c;
	wire s,s1;
	
	orgate2 banana (s1,a,b);
	orgate2 maca (s,s1,c);
	
	initial begin : start
		a = 0;
		b = 0;
		c = 0;
	end
	
	initial begin : main
			$display ("\nExemplo 0015 - Debora Deslandes de Almeida Batista");
			$display ("\nMatricula : 451549");
			$display ("\nTest OR gate");
			$display ("\n((a|b)|c) = s");
			$monitor ("\n((%b|%b)|%b) = %b" , a,b,c,s);
				#1 a = 0; b = 0; c = 1;
				#1 a = 0; b = 1; c = 0;
				#1 a = 0; b = 1; c = 1;
				#1 a = 1; b = 0; c = 0;
				#1 a = 1; b = 0; c = 1;
				#1 a = 1; b = 1; c = 0;
				#1 a = 1; b = 1; c = 1;
		end
endmodule