// Exemplo0004 - OR
// Nome: Luiz Henrique da Costa Silva
// Matricula: 449800

// -- OR gate

module orgate (output s, input p, q);
	assign s = p | q;

endmodule			//orgate

// -- test or gate

module testorgate;
					//dados locais

	reg a, b;		//definir registradores
	
	wire s;		//definir conexao (fio)

					//instancia
	orgate OR1 (s, a, b);
					//preparacao
	initial begin:start
		a=0; b=0;	//atribuicao simultanea dos valores iniciais
	end
					//parte principal
					
	initial begin
		$display("Exemplo 0004 - Luiz Henrique da Costa Silva - 449800");
		$display("Test OR gate:");
		$display("\na & b = s\n");
			a = 0; b = 0;
		$display("%b & %b = %b", a, b, s);
			a = 0; b = 1;
		$display("%b & %b = %b", a, b, s);
			a = 1; b = 0;
		$display("%b & %b = %b", a, b, s);
			a = 1; b = 1;
		$display("%b & %b = %b", a, b, s);
	end
endmodule //testorgate