// ----------------------------------------------------------------------
// Exemplo 0009 - NAND
// Debora Deslandes de Almeida Batista
// Matricula : 451549
// ----------------------------------------------------------------------

// ----------------------------------------------------------------------
// -- NAND gate
// ----------------------------------------------------------------------

	module nandgate ( output s, input a,b);
		assign s = ((~a)|(~b));
	endmodule // nandgate
	
// ----------------------------------------------------------------------
// -- test NAND gate
// ----------------------------------------------------------------------

	module testnandgate;
	
	reg a,b;
	wire s;
	
	nandgate mar (s,a,b);
	
	initial begin : start
		a = 0; b = 0 ;
	end
	
	initial begin : main
		$display ("\nExemplo 0009 - Debora Deslandes de Almeida");
		$display ("\nMatricula : 451549");
		$display ("\nTest NAND gate");
		$display ("\n((~a)|(~b)) = s");
		a = 0; b = 0;
		$monitor ("\n((~%b)|(~%b) = %b",a,b,s);
			#1 a = 1; b = 0;
			#1 a = 0; b = 1;
			#1 a = 1; b = 1;
end
endmodule