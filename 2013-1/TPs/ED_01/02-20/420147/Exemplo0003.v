// -------------------------
// Exemplo0003 - AND
// Nome: Victor Raphael Machado de Amorim
// Matricula: 420147
// -------------------------

// -------------------------
// -- and gate
// -------------------------
module andgate (output s, input p, input q);
	assign s = p & q;
	
endmodule // andgate

// -------------------------
// -- test andgate
// -------------------------
module testandgate;
// ------------------------- dados locais
	reg a, b; // definir registrador
				// (variavel independente)
	wire s; // definir conexao (fio)
				// (variavel dependente )
// ------------------------- instancia
	andgate AND1 (s, a, b);
// ------------------------- preparacao
	initial begin:start
					// atribuicao simultanea
					// dos valores iniciais
	 a=0; b=0;
	end
// ------------------------- parte principal
 initial begin:main
		// execucao unitaria
	$display("Exemplo 0003 - Victor Raphael Machado de Amorim - 420147");
	$display("Test AND gate:");
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
 
endmodule // testandgate