// -----------------------------------------------------------
// -- Exemplo005 - 	XOR
// -- Nome:				Alexandre Palmieri Sad
// -- Matricula:		440265
// -----------------------------------------------------------

// -----------------------------------------------------------
// -- xor gate
// -----------------------------------------------------------
module xorgate(output [0:3]s, input [0:3]p, input [0:3]q);
	assign s = p^q;
endmodule // -- nome

// -----------------------------------------------------------
// -- teste xor gate
// -----------------------------------------------------------

module nome;
	// --------------------------------- dados locais
		reg [0:3]a,b;	// -- definir registradores
		wire [0:3]s;	// -- definir conexao
		
	// ------------------------------------ instancia
		xorgate XOR1(s, a, b);
		
	// ----------------------------------- preparacao
		initial begin: start
			a = 4'b0011;
			b = 4'b0101;
		end
		
	// ------------------------------ parte principal
		initial begin
			$display("Exemplo005 - Sad - 440265");
			$display("Teste XOR gate");
			$display("\na ^ b = s\n");
			
			$monitor("%b ^ %b = %b", a, b, s);
		#1 a = 0; b = 0;					// -- valores decimais
		#1 a = 4'b0010; b = 4'b0001;	// -- valores binarios
		#1 a = 4'd1; b = 3;				// -- decimal e decimal
		#1 a = 4'o5; b = 2;				// -- octal e decimal
		#1 a = 4'hA; b = 3;				// -- hexadecimal e decimal
		#1 a = 4'h9; b = 4'o3;			// -- hexadecimal e octal
		end
endmodule // -- nome
			 