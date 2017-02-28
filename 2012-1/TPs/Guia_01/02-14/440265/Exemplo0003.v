// -------------------------------------------------
// -- Exemplo003 - 	AND
// -- Nome:				Alexandre Palmieri Sad
// -- Matricula:		440265
// -------------------------------------------------



// -------------------------------------------------
// -- and gate
// -------------------------------------------------
module andgate(output s, input p, input q);
	assign s = p & q;
endmodule // -- andgate

// -------------------------------------------------
// -- teste and gate
// -------------------------------------------------

module testandgate;
	// --------------------------------- dados locais
		reg a, b;	// -- definir registradores
		wire s;		// -- definir conexao
	
	// ------------------------------------ instancia
		andgate AND1(s, a, b);
		
	// ----------------------------------- preparacao
		initial begin: start
			a = 0; // -- atribuicao simultanea dos
			b = 0; // -- valores iniciais
		end
		
	// ------------------------------ parte principal
		initial begin
			$display("Exemplo003 - Sad - 440265");
			$display("Teste AND gate");
			$display("\na & b = s\n");
			a = 0;
			b = 0;
		#1 $display("%b & %b = %b", a, b , s);
			a = 0;
			b = 1;
		#1 $display("%b & %b = %b", a, b , s);
			a = 1;
			b = 0;
		#1 $display("%b & %b = %b", a, b , s);
			a = 1;
			b = 1;
		#1 $display("%b & %b = %b", a, b , s);
		end
endmodule // -- testandgate
			 