// -------------------------
// Exercicio06 - XOR
// Nome: Djonatas Tulio Rodrigues Costa
// Matricula: 440954
// -------------------------

// -------------------------
// -- xor gate
// -------------------------
module xorgate (output s, input a, input b);
	assign s = ((~a)&b) | (a&(~b));
endmodule // xorgate

// -------------------------
// -- test xor gate
// -------------------------
module testxorgate;
// ------------------------- dados locais
	reg a, b;		// definir registrador
				// (variavel independente)
	wire s;			// definir conexao (fio)
				// (variavel dependente)
// ------------------------- instancia
	xorgate XOR1 (s, a, b);
// ------------------------- preparacao
	initial begin:start
		a=0; b=0;
	end
// ------------------------- parte principal
	initial begin:main
		$display("Exercicio06 - Djonatas Tulio Rodrigues Costa - 440954");
		$display("Test XOR gate");
		$display("\na ^ b = s\n");
		$monitor("%b ^ %b = %b", a, b, s);
	#1 a=0; b=1;
	#1 a=1; b=0;
	#1 a=1; b=1;
	end
	
endmodule // testxorgate
