// ----------------------------------------------------------------------
// Exemplo 006 - NAND
// Nome: Débora Deslandes de Almeida
// Matricula: 451549
// ----------------------------------------------------------------------

// ----------------------------------------------------------------------
// -- nand gate
// ----------------------------------------------------------------------

	module nandgate (output s, input e,i);
		assign s = (~(e&i));
	endmodule // nandgate
	
// ----------------------------------------------------------------------
// -- testnandgate
// ----------------------------------------------------------------------

	module testnandgate;
		// --------------------------------------------------- dados locais
		
		reg e,i;
		wire s;
		
		// ------------------------------------------------------- instacia
		
		nandgate praia (s,e,i);
		
		// ----------------------------------------------------- preparacao
		
		initial begin : start
			// valor inicial
			e = 0; i = 0;
		end
		// ------------------------------------------------ parte principal
		
		initial begin : main
			$display ("\nExemplo 006 - Debora Deslandes de Almeida Batista");
			$display ("\nMatricula : 451549");
			$display ("\nTest NAND gate");
			$display ("\n(~(e & i)) = s");
			#1 $display ("\n\n(~(%b & %b)) = %b", e,i,s);
			e = 1; i = 0;
			#1 $display ("\n(~(%b & %b)) = %b", e,i,s);
			e = 0; i = 1;
			#1 $display ("\n(~(%b & %b)) = %b", e,i,s);
			e = 1; i = 1;
			#1 $display ("\n(~(%b & %b)) = %b", e,i,s);
		end
endmodule // nandgate