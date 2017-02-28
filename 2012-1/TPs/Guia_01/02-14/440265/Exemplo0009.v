// ---------------------------------------------------------------
// -- Exemplo0009 - 	NAND Morgan aplicado
// -- Nome:				Alexandre Palmieri Sad
// -- Matricula:		440265
// ---------------------------------------------------------------

// ---------------------------------------------------------------
// -- nand com Morgan
// ---------------------------------------------------------------

module nandGate( output s, input p, input q );
	assign s = ~p | ~q;
endmodule // -- nandGate

// ---------------------------------------------------------------
// -- teste nand
// ---------------------------------------------------------------

module testNandGate;
	// --------------------------------- dados locais
		reg a, b;	// -- definir registradores
		wire s;		// -- definir conexao
		
	// ------------------------------------ instancia
		nandGate NAND1(s, a, b);
		
	// ----------------------------------- preparacao
		initial begin: start
			a = 0;
			b = 0;
		end
		
	// ------------------------------ parte principal
		initial begin
			$display("Exemplo0009 - Sad - 440265");
			$display("Teste NAND gate com Morgan: ");
			$display("\n~a | ~b = s\n");
			
			$monitor("~%b | ~%b = %b", a, b, s);
			
		#1
			a = 0; b = 0;
		#1
			a = 0; b = 1;
		#1
			a = 1; b = 0;
		#1
			a = 1; b = 1;			
		end	
		
endmodule // -- testeNandGate

// -- FIM DO PROGRAMA
			 