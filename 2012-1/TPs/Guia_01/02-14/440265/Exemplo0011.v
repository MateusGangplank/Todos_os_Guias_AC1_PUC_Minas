// ---------------------------------------------------------------
// -- Exemplo0011 - 	XOR com expressao
// -- Nome:				Alexandre Palmieri Sad
// -- Matricula:		440265
// ---------------------------------------------------------------

// ---------------------------------------------------------------
// -- xor Gate
// ---------------------------------------------------------------

module xorGate( output s, input p, input q );
	assign s = (~p & q) | (p & ~q);
endmodule // -- xorGate

// ---------------------------------------------------------------
// -- Teste Xor gate
// ---------------------------------------------------------------

module testXorGate;
	// --------------------------------- dados locais
		reg a, b;	// -- definir registradores
		wire s;		// -- definir conexao
		
	// ------------------------------------ instancia
		xorGate XOR1(s, a, b);
		
	// ----------------------------------- preparacao
		initial begin: start
			a = 0;
			b = 0;
		end
		
	// ------------------------------ parte principal
		initial begin
			$display("Exemplo0011 - Sad - 440265");
			$display("Teste XOR gate com expressao");
			$display("\n(~a & b) | (a & ~b) = s\n");
			$monitor("(~%b & %b) | (%b & ~%b) = %b", a, b, a, b, s);
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
			 