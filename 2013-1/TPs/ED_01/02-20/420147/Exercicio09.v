// Exercicio 09 - AND
// Nome: Victor Raphael Machado de Amorim
// Matricula: 420147
// -------------------------

// -------------------------
// -- and gate
// -------------------------

module andgate (output s, input p, input q, input r);
	 wire temp1, temp2;
	 
	 and AND1 (temp1, p, q);
	 and AND2 (temp2, q, r);
	 and AND3 (s, temp1, temp2);
	
endmodule // andgate

// -------------------------
// -- test andgate
// -------------------------
module testandgate;
// ------------------------- dados locais
	reg a, b, c; // definir registrador
				// (variavel independente)
	wire s; // definir conexao (fio)
				// (variavel dependente )
// ------------------------- instancia
	andgate AND1 (s, a, b, c);
// ------------------------- preparacao
	initial begin:start
					// atribuicao simultanea
					// dos valores iniciais
	 a=0; b=0; c=0;
	end
// ------------------------- parte principal
 initial begin:main
		// execucao unitaria
	$display("Exercicio 09 - Victor Raphael Machado de Amorim - 420147");
	$display("Test AND gate:");
	$display("\na + b + c = s\n");
	$monitor("%b AND %b AND %b = %b", a, b, c, s);

 #1 a=1;
 #1 b=1;
 #1 c=1;
 #1 a=0;
 #1 b=0;
 
 end
 
endmodule // testandgate