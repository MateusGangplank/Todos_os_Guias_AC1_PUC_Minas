// -------------------------------------------------
// -- Exemplo004 - 	OR
// -- Nome:				Alexandre Palmieri Sad
// -- Matricula:		440265
// -------------------------------------------------

// -------------------------------------------------
// -- or gate
// -------------------------------------------------
module orgate(output s, input p, input q);
	assign s = p | q;
endmodule // -- orgate

// -------------------------------------------------
// -- test or gate
// -------------------------------------------------

module testorgate;
	// --------------------------------- dados locais
		reg a, b;	// -- definir registradores 
		wire s;		// -- definir conexao (fio);
		
	// ------------------------------------ instancia
		orgate OR1(s, a, b);
		
	// ----------------------------------- preparacao
		initial begin: strat
			a = 0; // -- atribuicao simultanea de 
			b = 0; // -- valores inciais
		end
	// ------------------------------ parte principal
		initial begin
			$display("Exemplo0004 - Sad - 440265");
			$display("Teste OR gate");
			$display("\na | b = s\n");
			a = 0;
			b = 0;
		#1 $display("%b | %b = %b", a, b, s);
			a = 0;
			b = 1;
		#1 $display("%b | %b = %b", a, b, s);
			a = 1;
			b = 0;
		#1 $display("%b | %b = %b", a, b, s);
			a = 1;
			b = 1;
		#1 $display("%b | %b = %b", a, b, s);
		end
			
endmodule // -- testorgate
			 