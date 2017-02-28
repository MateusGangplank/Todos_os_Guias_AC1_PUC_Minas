// ---------------------------------------------------------------
// -- Exemplo0013 - 	AND com 3 entradas
// -- Nome:				Alexandre Palmieri Sad
// -- Matricula:		440265
// ---------------------------------------------------------------

// ---------------------------------------------------------------
// -- and gate
// ---------------------------------------------------------------

module andGate( output s, input p, input q, input t );
	assign s = p & q & t;
endmodule // -- andGate

// ---------------------------------------------------------------
// -- teste and gate
// ---------------------------------------------------------------

module nome;
	// --------------------------------- dados locais
		reg a, b, c;
		wire s;
		
	// ------------------------------------ instancia
		andGate AND1(s, a, b, c);
		
	// ----------------------------------- preparacao
		initial begin: start
			a = 0;
			b = 0;
			c = 0;
		end
		
	// ------------------------------ parte principal
		initial begin
			$display("Exemplo0013 - Sad - 440265");
			$display("Teste AND gate com 3 entradas");
			$display("\na & b & c = s\n");
			$monitor("%b & %b & %b = %b", a, b, c, s);
			
			#1
			a = 0; b = 0; c = 0;
			#1
			a = 0; b = 0; c = 1;			
			#1
			a = 0; b = 1; c = 0;
			#1
			a = 0; b = 1; c = 1;
			#1
			a = 1; b = 0; c = 0;
			#1
			a = 1; b = 0; c = 1;
			#1
			a = 1; b = 1; c = 0;
			#1
			a = 1; b = 1; c = 1;			
		end
			
endmodule // -- nome

// -- FIM DO PROGRAMA
			 