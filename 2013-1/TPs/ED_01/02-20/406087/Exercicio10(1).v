// Exercicio10 - OR3entradas
// Nome: Luiz Henrique da Costa Silva
// Matricula: 449800

// -- OR 3entradas gate

module or3entradasgate (output s, input p, input q, input r);
	assign s = p | ~((~p)&(~r));

endmodule			//or3entradasgate

// -- test OR 3entradas gate

module testor3entradasgate;
					//dados locais

	reg a, b, c;		//definir registradores
	
	wire s;		//definir conexao (fio)

					//instancia
	or3entradasgate OR3ENTRADAS1 (s, a, b, c);
					//preparacao
	initial begin:start
		a=0; b=0; c=0;	//atribuicao simultanea dos valores iniciais
	end
					//parte principal
					
	initial begin
		$display("Exercicio10 - Luiz Henrique da Costa Silva - 449800");
		$display("Test or 3entradas gate:");
		$display("\n a | ~((~b) & (~c)) = s \n");
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
endmodule //testor3entradas