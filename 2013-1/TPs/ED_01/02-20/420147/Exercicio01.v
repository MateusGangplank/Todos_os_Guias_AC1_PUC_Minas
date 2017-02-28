// Exercicio 01 - NAND
// Nome: Victor Raphael Machado de Amorim
// Matricula: 420147
// -------------------------

// -------------------------
// -- nand gate
// -------------------------
module nandgate (output s, input p, input q);
	assign s = (~(p&q));
	
endmodule // nandgate

// -------------------------
// -- test nandgate
// -------------------------
module testnandgate;
// ------------------------- dados locais
	reg a, b; // definir registrador
				// (variavel independente)
	wire s; // definir conexao (fio)
				// (variavel dependente )
// ------------------------- instancia
	nandgate NAND1 (s, a, b);
// ------------------------- preparacao
	initial begin:start
					// atribuicao simultanea
					// dos valores iniciais
	 a=0; b=0;
	end
// ------------------------- parte principal
 initial begin:main
		// execucao unitaria
	$display("Exercicio 01 - Victor Raphael Machado de Amorim - 420147");
	$display("Test NAND gate:");
	$display("\na = s\n");
	 a=0;b=0;
#1 $display("%b & %b = %b", a, b, s);
	 a=0; b=1;
#1 $display("%b & %b = %b", a, b, s);
	 a=1; b=0;
#1 $display("%b & %b = %b", a, b, s);
	 a=1; b=1;
#1 $display("%b & %b = %b", a, b, s);

 end
 
endmodule // testnandgate