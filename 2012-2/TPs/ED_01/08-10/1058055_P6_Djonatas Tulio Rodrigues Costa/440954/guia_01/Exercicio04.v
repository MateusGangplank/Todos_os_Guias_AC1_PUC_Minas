// -------------------------
// Exercicio04 - NAND (propriedade de Morgan)
// Nome: Djonatas Tulio Rodrigues Costa
// Matricula: 440954
// -------------------------

// -------------------------
// -- nand gate
// -------------------------
module nandgate (output s, input p, input q);
	assign s = ~p | ~q;
endmodule // nandgate

// -------------------------
// -- test nand gate
// -------------------------
module testnandgate;
// ------------------------- dados locais
	reg a, b;		// definir registrador
				// (variavel independente)
	wire s;			// definir conexao (fio)
				// (variavel dependente)
// ------------------------- instancia
	nandgate NAND1 (s, a, b);
// ------------------------- preparacao
	initial begin:start
		a=0; b=0;
	end
// ------------------------- parte principal
	initial begin:main
		$display("Exercicio04 - Djonatas Tulio Rodrigues Costa - 440954");
		$display("Test NAND(Morgan) gate");
		$display("\n~a | ~b = s\n");
	#1 $display("~%b | ~%b = %b", a, b, s);
		a=0; b=1;
	#1 $display("~%b | ~%b = %b", a, b, s);
		a=1; b=0;
	#1 $display("~%b | ~%b = %b", a, b, s);
		a=1; b=1;
	#1 $display("~%b | ~%b = %b", a, b, s);
	end
	
endmodule // testnandgate
