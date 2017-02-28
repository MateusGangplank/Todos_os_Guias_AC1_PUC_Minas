// -----------------------------------------------------------
// -- Exemplo0007 - 	NOR
// -- Nome:				Alexandre Palmieri Sad
// -- Matricula:		440265
// -----------------------------------------------------------

// -----------------------------------------------------------
// -- norgate
// -----------------------------------------------------------
module norgate(output s, input p, input q);
	assign s = ~(p | q);
endmodule // -- norgate

// -------------------------------------------------
// -- teste nor gate
// -------------------------------------------------

module testNorGate;
	// ------------------------------------------- dados locais
		reg a, b;	// -- definir registradores
		wire s;		// -- definir conexao
		
	// ---------------------------------------------- instancia
		norgate NOR1(s, a, b);
		
	// --------------------------------------------- praparacao
		initial begin: start
			a = 0;
			b = 0;
		end
		
	// ---------------------------------------- parte principal
		initial begin
			$display("Exemplo0007 - Sad - 440265");
			$display("Teste NOR gate");
			$display("\n~(a | b) = s\n");
			$monitor("~(%b | %b) = %b", a, b, s);
			
		#1 
			a = 0; b = 0;
		#1 
			a = 0; b = 1;
		#1 
			a = 1; b = 0;
		#1 
			a = 1; b = 1;
		end
endmodule // -- testeNorGate