// -------------------------
// Exercicio05 - NOR (propriedade de Morgan)
// Nome: Djonatas Tulio Rodrigues Costa
// Matricula: 440954
// -------------------------

// -------------------------
// -- nor gate
// -------------------------
module norgate (output s, input p, input q);
	assign s = ~p & ~q;
endmodule // norgate

// -------------------------
// -- test nor gate
// -------------------------
module testnorgate;
// ------------------------- dados locais
	reg a, b;		// definir registrador
				// (variavel independente)
	wire s;			// definir conexao (fio)
				// (variavel dependente)
// ------------------------- instancia
	norgate NOR1 (s, a, b);
// ------------------------- preparacao
	initial begin:start
		a=0; b=0;
	end
// ------------------------- parte principal
	initial begin:main
		$display("Exercicio05 - Djonatas Tulio Rodrigues Costa - 440954");
		$display("Test NOR(Morgan) gate");
		$display("\n~a & ~b = s\n");
		$monitor("~%b & ~%b = %b", a, b, s);
	#1 a=0; b=1;
	#1 a=1; b=0;
	#1 a=1; b=1;
	end
	
endmodule // testnorgate
