// ---------------------------------------------------------------
// -- Exemplo0012 - 	XNOR com expressao
// -- Nome:				Alexandre Palmieri Sad
// -- Matricula:		440265
// ---------------------------------------------------------------

// ---------------------------------------------------------------
// -- xnor gate
// ---------------------------------------------------------------

module xnorGate( output s, input p, input q );
	assign s = (p & q) | (~p & ~q);
endmodule // -- xnorGate

// ---------------------------------------------------------------
// -- teste xnor gate
// ---------------------------------------------------------------

module testXnorGate;
	// --------------------------------- dados locais
		reg a, b;	// -- definir registradores
		wire s;		// -- definir conexoes
		
	// ------------------------------------ instancia
		xnorGate XNOR1(s, a, b);
	
	// ----------------------------------- preparacao
		initial begin: start
			a = 0;
			b = 0;
		end
		
	// ------------------------------ parte principal
		initial begin
			$display("Exemplo0012 - Sad - 440265");
			$display("Teste XNOR gate com expressao");
			$display("\n(a & b) | (~a & ~b) = s\n");
			$monitor("(%b & %b) | (~%b & ~%b) = %b", a, b, a, b, s);
			
			#1
				a = 0; b = 0;
			#1
				a = 0; b = 1;
			#1
				a = 1; b = 0;
			#1
				a = 1; b = 1;
		end	
		
endmodule // -- tsetXnorGate

// -- FIM DO PROGRAMA
			 