// -------------------------
// Exercicio03 - XNOR
// Nome: Djonatas Tulio Rodrigues Costa
// Matricula: 440954
// -------------------------

// -------------------------
// -- xnor gate
// -------------------------
module xnorgate (output s, input p, input q);
	assign s = ~(p ^ q);
endmodule // xnorgate

// -------------------------
// -- test xnor gate
// -------------------------
module testxnorgate;
// ------------------------- dados locais
	reg a, b;		// definir registrador
				// (variavel independente)
	wire s;			// definir conexao (fio)
				// (variavel dependente)
// ------------------------- instancia
	xnorgate XNOR1 (s, a, b);
// ------------------------- preparacao
	initial begin:start
		a=0; b=0;
	end
// ------------------------- parte principal
	initial begin:main
		$display("Exercicio03 - Djonatas Tulio Rodrigues Costa - 440954");
		$display("Test XNOR gate");
		$display("\n~(a ^ b) = s\n");
		$monitor("~(%b ^ %b) = %b", a, b, s);
	#1 a=0; b=1;
	#1 a=1; b=0;
	#1 a=1; b=1;
	end
	
endmodule // testxnorgate
