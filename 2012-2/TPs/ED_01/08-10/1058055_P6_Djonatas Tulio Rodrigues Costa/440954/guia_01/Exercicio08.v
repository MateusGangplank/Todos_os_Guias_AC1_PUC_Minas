// -------------------------
// Exercicio08 - (AND com 4 entradas)
// Nome: Djonatas Tulio Rodrigues Costa
// Matricula: 440954
// -------------------------

// -------------------------
// -- and gate
// -------------------------
module andgate (output s, input a, input b, input c, input d);
	assign s = a & b & c & d;
endmodule // andgate

// -------------------------
// -- test and gate
// -------------------------
module testandgate;
// ------------------------- dados locais
	reg a, b, c, d;		// definir registrador
				// (variavel independente)
	wire s;			// definir conexao (fio)
				// (variavel dependente)
// ------------------------- instancia
	andgate AND1 (s, a, b, c, d);
// ------------------------- preparacao
	initial begin:start
		a=0; b=0; c=0; d=0;
	end
// ------------------------- parte principal
	initial begin:main
		$display("Exercicio08 - Djonatas Tulio Rodrigues Costa - 440954");
		$display("Test AND(4 entradas) gate");
		$display("\na & b & c & d = s\n");
		$monitor("%b & %b & %b & %b = %b", a, b, c, d, s);
	#1 a=0; b=0; c=0; d=1;
	#1 a=0; b=0; c=1; d=0;
	#1 a=0; b=0; c=1; d=1;
	#1 a=0; b=1; c=0; d=0;
	#1 a=0; b=1; c=0; d=1;
	#1 a=0; b=1; c=1; d=0;
	#1 a=0; b=1; c=1; d=1;
	#1 a=1; b=0; c=0; d=0;
	#1 a=1; b=0; c=0; d=1;
	#1 a=1; b=0; c=1; d=0;
	#1 a=1; b=0; c=1; d=1;
	#1 a=1; b=1; c=0; d=0;
	#1 a=1; b=1; c=0; d=1;
	#1 a=1; b=1; c=1; d=0;
	#1 a=1; b=1; c=1; d=1;
	end
	
endmodule // testandgate
