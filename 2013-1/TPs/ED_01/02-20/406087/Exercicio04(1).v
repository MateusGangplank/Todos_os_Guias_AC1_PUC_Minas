// Exercicio04 - NANDMorgan
// Nome: Luiz Henrique da Costa Silva
// Matricula: 449800

// -- nandmorgan gate

module nandmorgangate (output s, input p, q);
	assign s = (~p) | (~q);

endmodule			//nandmorgangate

// -- test nand morgan gate

module testnandmorgangate;
					//dados locais

	reg a, b;		//definir registradores
	
	wire s;		//definir conexao (fio)

					//instancia
	nandmorgangate NANDMORGAN1 (s, a, b);
					//preparacao
	initial begin:start
		a=0; b=0;	//atribuicao simultanea dos valores iniciais
	end
					//parte principal
					
	initial begin
		$display("Exercicio04 - Luiz Henrique da Costa Silva - 449800");
		$display("Test NAND Morgan gate:");
		$display("\n (~a) | (~b) = s\n");
		$monitor("%b & %b = %b", a, b, s);
		#1 a = 0; b = 0;
		#1 a = 0; b = 1;
		#1 a = 1; b = 0;
		#1 a = 1; b = 1;

	end
endmodule //testnandmorgangate