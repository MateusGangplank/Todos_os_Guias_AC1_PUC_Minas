// Exemplo0003 - AND
// Nome: Luiz Henrique da Costa Silva
// Matricula: 449800

// -- and gate

module andgate (output s, input p, input q);
	assign s = p & q;

endmodule			//andgate

// -- test not gate

module testandgate;
					//dados locais

	reg a, b;		//definir registradores
	
	wire s;		//definir conexao (fio)

					//instancia
	andgate AND1 (s, a, b);
					//preparacao
	initial begin:start
		a=0; b=0;	//atribuicao simultanea dos valores iniciais
	end
					//parte principal
					
	initial begin
		$display("Exemplo 0003 - Luiz Henrique da Costa Silva - 449800");
		$display("Test AND gate:");
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
endmodule //testandgate