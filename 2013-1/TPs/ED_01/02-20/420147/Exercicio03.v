// Exercicio 03 - XNOR
// Nome: Victor Raphael Machado de Amorim
// Matricula: 420147
// -------------------------

// -------------------------
// -- xnor gate
// -------------------------
module xnorgate (output s, input p, input q);
	assign s = ( ~(p^q));
	
endmodule // xnorgate

// -------------------------
// -- test xnorgate
// -------------------------
module testxnorgate;
// ------------------------- dados locais
	reg a, b; // definir registrador
				// (variavel independente)
	wire s; // definir conexao (fio)
				// (variavel dependente )
// ------------------------- instancia
	xnorgate XNOR1 (s, a, b);
// ------------------------- preparacao
	initial begin:start
					// atribuicao simultanea
					// dos valores iniciais
	 a=0; b=0;
	end
// ------------------------- parte principal
 initial begin:main
		// execucao unitaria
	$display("Exercicio 03 - Victor Raphael Machado de Amorim - 420147");
	$display("Test XNOR gate:");
	$display("\na XNOR b = s\n");
	$monitor("%b XNOR %b = %b", a, b, s);

 #1 a=1;
 #1 a=0; b=1;
 #1 a=1; b=1;
 end
 
endmodule // testxnorgate