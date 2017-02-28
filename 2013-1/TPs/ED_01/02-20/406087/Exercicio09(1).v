// Exercicio08 - AND3entradascomposto
// Nome: Luiz Henrique da Costa Silva
// Matricula: 449800

// -- and 3entradascomposto gate

module and3entradascompostogate (output s, input p, input q, input r);
	assign s = ((~p) | (~q)) & r;

endmodule			//and3entradascompostogate

// -- test and 3entradascomposto gate

module testand3entradascompostogate;
					//dados locais

	reg a, b, c;		//definir registradores
	
	wire s;		//definir conexao (fio)

					//instancia
	and3entradascompostogate AND3ENTRADASCOMPOSTO1 (s, a, b, c);
					//preparacao
	initial begin:start
		a=0; b=0; c=0;	//atribuicao simultanea dos valores iniciais
	end
					//parte principal
					
	initial begin
		$display("Exercicio09 - Luiz Henrique da Costa Silva - 449800");
		$display("Test and 3entradascomposto gate:");
		$display("\n ((~a) | (~b)) & c = s \n");
		$monitor("%b | %b & %b = %b", a, b, c, s);
		#1 a = 0; b = 0; c = 0;
		#1 a = 0; b = 0; c = 1;
		#1 a = 0; b = 1; c = 0;
		#1 a = 0; b = 1; c = 1;
		#1 a = 1; b = 0; c = 0;
		#1 a = 1; b = 0; c = 1;
		#1 a = 1; b = 1; c = 0;
		#1 a = 1; b = 1; c = 1;

	end
endmodule //test3entradascompostogate