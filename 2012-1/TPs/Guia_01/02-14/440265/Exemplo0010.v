// ---------------------------------------------------------------
// -- Exemplo0010 - 	NOR com Morgan
// -- Nome:				Alexandre Palmieri Sad
// -- Matricula:		440265
// ---------------------------------------------------------------

// ---------------------------------------------------------------
// -- nor gate
// ---------------------------------------------------------------

module norGate( output s, input p, input q );
	assign s = ~p & ~q;
endmodule // -- norGate

// ---------------------------------------------------------------
// -- teste norGate
// ---------------------------------------------------------------

module testNorGate;
	// --------------------------------- dados locais
		reg a, b;	// -- definir registradores
		wire s;		// -- definir conexoes
		
	// ------------------------------------ instancia
		norGate NOR1(s, a, b);
		
	// ----------------------------------- preparacao
		initial begin: start
			a = 0;
			b = 0;
		end
		
	// ------------------------------ parte principal
		initial begin
			$display("Exemplo0010 - Sad - 440265");	
			$display("Teste NOR gate com Morgan: ");
			$display("\n~a & ~b = s\n");
			
			$monitor("~%b & ~%b = %b", a, b, s);
			
			#1
				a = 0; b = 0;
			#1
				a = 0; b = 1;
			#1
				a = 1; b = 0;
			#1
				a = 1; b = 1;
		end			
endmodule // -- nome

// -- FIM DO PROGRAMA
			 