// Exercicio02 - NOR
// Nome: Luiz Henrique da Costa Silva
// Matricula: 449800

// -- nor gate

module norgate (output s, input p, q);
	assign s = ~(p | q);

endmodule			//nordgate

// -- test nor gate

module testnorgate;
					//dados locais

	reg a, b;		//definir registradores
	
	wire s;		//definir conexao (fio)

					//instancia
	norgate NOR1 (s, a, b);
					//preparacao
	initial begin:start
		a=0; b=0;	//atribuicao simultanea dos valores iniciais
	end
					//parte principal
					
	initial begin
		$display("Exercicio02 - Luiz Henrique da Costa Silva - 449800");
		$display("Test NOR gate:");
		$display("\n ~(a | b) = s\n");
		$monitor("%b | %b = %b", a, b, s);
		#1 a = 0; b = 0;
		#1 a = 0; b = 1;
		#1 a = 1; b = 0;
		#1 a = 1; b = 1;

	end
endmodule //testnorgate