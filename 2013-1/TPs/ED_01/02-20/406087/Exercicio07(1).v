// Exercicio02 - XNORexpression
// Nome: Luiz Henrique da Costa Silva
// Matricula: 449800

// -- xnor expression gate

module xnorexpressiongate (output s, input p, q);
	assign s = (p&q)|(~p & ~q);

endmodule			//xnorexpressiongate

// -- test xnor expression gate

module testxnorexpressiongate;
					//dados locais

	reg a, b;		//definir registradores
	
	wire s;		//definir conexao (fio)

					//instancia
	xnorexpressiongate XNOREXPRESSION1 (s, a, b);
					//preparacao
	initial begin:start
		a=0; b=0;	//atribuicao simultanea dos valores iniciais
	end
					//parte principal
					
	initial begin
		$display("Exercicio07 - Luiz Henrique da Costa Silva - 449800");
		$display("Test XNOR Expression gate:");
		$display("\n (a & b)|(~a & ~b) = s\n");
		$monitor("%b | %b = %b", a, b, s);
		#1 a = 0; b = 0;
		#1 a = 0; b = 1;
		#1 a = 1; b = 0;
		#1 a = 1; b = 1;

	end
endmodule //testnorexpressiongate