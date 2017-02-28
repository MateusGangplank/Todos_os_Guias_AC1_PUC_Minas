// Exercicio 02 - NOR
// Nome: Victor Raphael Machado de Amorim
// Matricula: 420147
// -------------------------

// -------------------------
// -- nor gate
// -------------------------
module norgate (output s, input p, input q);
	assign s = ( ~(p|q));
	
endmodule // norgate

// -------------------------
// -- test norgate
// -------------------------
module testnorgate;
// ------------------------- dados locais
	reg a, b; // definir registrador
				// (variavel independente)
	wire s; // definir conexao (fio)
				// (variavel dependente )
// ------------------------- instancia
	norgate NOR1 (s, a, b);
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
	$display("Test NOR gate:");
	$display("\na NOR b = s\n");
	$monitor("%b NOR %b = %b", a, b, s);

 #1 a=1;
 #1 a=0; b=1;
 #1 a=1; b=1;
 end
 
endmodule // testnorgate