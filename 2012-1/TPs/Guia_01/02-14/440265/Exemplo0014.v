// ---------------------------------------------------------------
// -- Exemplo0014 - 	AND com 3 entradas usando outro de 2
// -- Nome:				Alexandre Palmieri Sad
// -- Matricula:		440265
// ---------------------------------------------------------------

// ---------------------------------------------------------------
// -- andGate 1
// ---------------------------------------------------------------

module andGate21( output s, input p, input q );
	assign s = p & q;
endmodule // -- andGate1

// ---------------------------------------------------------------
// -- andGate 2
// ---------------------------------------------------------------

module andGate31( output s, input a, input b, input c );
	wire s1;
	andGate21 M21(s1, a, b);
	andGate21 M22(s, s1, c);
endmodule // -- andGate2

// ---------------------------------------------------------------
// -- AND gate teste
// ---------------------------------------------------------------

module andGate31Teste;
	// --------------------------------- dados locais
		reg a, b, c;
		wire s, sf;
		
	// ------------------------------------ instancia
		andGate31 AND1(s, a, b, c);
		
	// ----------------------------------- preparacao
		initial begin: start
			a = 0;
			b = 0;
			c = 0;
		end
		
	// ------------------------------ parte principal
		initial begin
			$display("Exemplo0014 - Sad - 440265");
			$display("Teste AND gate");
			$display("\na & b & s = sf\n");
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
endmodule // -- teste andGate31

// -- FIM DO PROGRAMA
			 