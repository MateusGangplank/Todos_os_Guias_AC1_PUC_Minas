// Exercicio 10 - OR
// Nome: Victor Raphael Machado de Amorim
// Matricula: 420147
// -------------------------

// -------------------------
// -- or gate
// -------------------------

module orgate (output s, input p, input q, input r);
	 wire temp1, temp2;
	 
	 or OR1 (temp1, p, q);
	 or OR2 (temp2, q, r);
	 or OR3 (s, temp1, temp2);
	
endmodule // orgate

// -------------------------
// -- test orgate
// -------------------------
module testorgate;
// ------------------------- dados locais
	reg a, b, c; // definir registrador
				// (variavel independente)
	wire s; // definir conexao (fio)
				// (variavel dependente )
// ------------------------- instancia
	orgate OR1 (s, a, b, c);
// ------------------------- preparacao
	initial begin:start
					// atribuicao simultanea
					// dos valores iniciais
	 a=0; b=0; c=0;
	end
// ------------------------- parte principal
 initial begin:main
		// execucao unitaria
	$display("Exercicio 10 - Victor Raphael Machado de Amorim - 420147");
	$display("Test OR gate:");
	$display("\na + b + c = s\n");
	$monitor("%b OR %b OR %b = %b", a, b, c, s);

 #1 a=1;
 #1 b=1;
 #1 c=1;
 #1 a=0;
 #1 b=0;
 
 end
 
endmodule // testorgate