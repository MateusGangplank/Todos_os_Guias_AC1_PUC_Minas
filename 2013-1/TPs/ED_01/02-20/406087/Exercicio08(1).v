// Exercicio08 - AND3entradas
// Nome: Luiz Henrique da Costa Silva
// Matricula: 449800

// -- and 3entradas gate

module and3entradasgate (output s, input p, input q, input r);
	assign s = p & q & r;

endmodule			//and3entradasgate

// -- test and 3entradas gate

module testand3entradasgate;
					//dados locais

	reg a, b, c;		//definir registradores
	
	wire s;		//definir conexao (fio)

					//instancia
	and3entradasgate AND3ENTRADAS1 (s, a, b, c);
					//preparacao
	initial begin:start
		a=0; b=0; c=0;	//atribuicao simultanea dos valores iniciais
	end
					//parte principal
					
	initial begin
		$display("Exercicio08 - Luiz Henrique da Costa Silva - 449800");
		$display("Test AND 3entradas gate:");
		$display("\n a & b & c = s \n");
		$monitor("%b ^ %b ^ %b = %b", a, b, c, s);
		#1 a = 0; b = 0; c = 0;
		#1 a = 0; b = 0; c = 1;
		#1 a = 0; b = 1; c = 0;
		#1 a = 0; b = 1; c = 1;
		#1 a = 1; b = 0; c = 0;
		#1 a = 1; b = 0; c = 1;
		#1 a = 1; b = 1; c = 0;
		#1 a = 1; b = 1; c = 1;

	end
endmodule //testand3entradasgate