// Exercicio02 - NORMorgan
// Nome: Luiz Henrique da Costa Silva
// Matricula: 449800

// -- nor morgan gate

module normorgangate (output s, input p, q);
	assign s = (~p) & (~q);

endmodule			//normorgangate

// -- test nor gate

module testnormorgangate;
					//dados locais

	reg a, b;		//definir registradores
	
	wire s;		//definir conexao (fio)

					//instancia
	normorgangate NORMORGAN1 (s, a, b);
					//preparacao
	initial begin:start
		a=0; b=0;	//atribuicao simultanea dos valores iniciais
	end
					//parte principal
					
	initial begin
		$display("Exercicio05 - Luiz Henrique da Costa Silva - 449800");
		$display("Test NOR Morgan gate:");
		$display("\n (~a) & (~b) = s\n");
		$monitor("%b | %b = %b", a, b, s);
		#1 a = 0; b = 0;
		#1 a = 0; b = 1;
		#1 a = 1; b = 0;
		#1 a = 1; b = 1;

	end
endmodule //testnormorgangate