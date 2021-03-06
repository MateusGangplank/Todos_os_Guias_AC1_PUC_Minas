// -----------------------------------------------------------
// -- Exemplo0006 - 	NAND
// -- Nome:				Alexandre Palmieri Sad
// -- Matricula:		440265
// -----------------------------------------------------------

// -----------------------------------------------------------
// -- nand gate
// -----------------------------------------------------------
module nandgate (output s, input p, input q);
	assign s = ~(p & q);
endmodule // -- nandgate

// -----------------------------------------------------------
// -- teste nand gate
// -----------------------------------------------------------

module testNandGate;
	// ------------------------------------------- dados locais
		reg a, b;		// -- definir registradores
		wire s;			// -- definir conexao
		
	// ---------------------------------------------- instancia
		nandgate NAND1(s, a, b);
		
	// -------------------------------------------- preaparacao
		initial begin: start
			a = 0;
			b = 0;
		end
	
	// ----------------------------------------- parte principal
		initial begin
			$display("Exemplo0006 - Sad - 440265");
			$display("Teste NAND gate");
			$display("\n~(a & b) = s\n");
			a = 0;
			b = 0;
		#1 $display("~(%b & %b) = %b", a, b, s);
			a = 0;
			b = 1;
		#1 $display("~(%b & %b) = %b", a, b, s);
			a = 1;
			b = 0;
		#1 $display("~(%b & %b) = %b", a, b, s);
			a = 1;
			b = 1;
		#1 $display("~(%b & %b) = %b", a, b, s);
		end
endmodule