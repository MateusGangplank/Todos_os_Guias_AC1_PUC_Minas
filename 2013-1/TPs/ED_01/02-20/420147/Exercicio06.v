// Exercicio 06 - XOR
// Nome: Victor Raphael Machado de Amorim
// Matricula: 420147
// -------------------------

// -------------------------
// -- xor gate
// -------------------------
module xorgate (output s, input p, input q);
	assign s = (~p & q) | (p & ~q);
	
endmodule // xorgate

// -------------------------
// -- test xorgate
// -------------------------
module testxorgate;
// ------------------------- dados locais
	reg a, b; // definir registrador
				// (variavel independente)
	wire s; // definir conexao (fio)
				// (variavel dependente )
// ------------------------- instancia
	xorgate XOR1 (s, a, b);
// ------------------------- preparacao
	initial begin:start
					// atribuicao simultanea
					// dos valores iniciais
	 a=0; b=0;
	end
// ------------------------- parte principal
 initial begin:main
		// execucao unitaria
	$display("Exercicio 02 - Victor Raphael Machado de Amorim - 420147");
	$display("Test XOR gate:");
	$display("\na XOR b = s\n");
	$monitor("%b XOR %b = %b", a, b, s);

 #1 a=1;
 #1 a=0; b=1;
 #1 a=1; b=1;
 end
 
endmodule // testxorgate