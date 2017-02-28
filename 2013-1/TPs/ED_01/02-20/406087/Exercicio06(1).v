// Exercicio06 - XORexpression
// Nome: Luiz Henrique da Costa Silva
// Matricula: 449800

// -- XOR expression gate

module xorexpressiongate (output s, input p, input  q);
	assign s = (~p & q)|(p &~q);
endmodule			//xorexpressiongate

// -- test xor expression gate

module testxorexpressiongate;
					//dados locais

	reg a,b;		//definir registradores
	
	wire s;		//definir conexao (fio)

					//instancia
	xorexpressiongate XOREXPRESSION1 (s, a, b);
					//preparacao
	initial begin:start
		a=0; b=0;
	end
					//parte principal
					
	initial begin: main
		$display("Exercicio 06 - Luiz Henrique da Costa Silva - 449800");
		$display("Test XOR expression gate:");
		$display("\n (~a & b)|(a &~b) = s\n");
		$monitor("%b | %b = %b", a, b, s);
		#1 a = 0; b = 0;
		#1 a = 0; b = 1;
		#1 a = 1; b = 0;
		#1 a = 1; b = 1;
	
	end
endmodule //testorgate