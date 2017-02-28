// -------------------------
// Exemplo0003 - AND
// Nome: Djonatas Tulio Rodrigues Costa
// Matricula: 440954
// -------------------------

// -------------------------
// -- and gate
// -------------------------
module andgate (output s, input p, input q);
	assign s = p & q;
endmodule // andgate

// -------------------------
// -- test and gate
// -------------------------
module testandgate;
// ------------------------- dados locais
	reg a, b;	// definir registrador
			// (variavel independente)
	wire s;		// definir conexao (fio)
			// (variavel dependente)
// ------------------------- instancia
	andgate NOT1 (s, a, b);
// ------------------------- preparacao
	initial begin:start
		a=0; b=0;
	end
// ------------------------- parte principal
	initial begin
		$display("Exemplo0003 - Djonatas Tulio Rodrigues Costa - 440954");
		$display("Test AND gate");
		$display("\na & b = s\n");
			a=0; b=0;
	#1 $display("%b & %b = %b", a, b, s);
			a=0; b=1;
	#1 $display("%b & %b = %b", a, b, s);
			a=1; b=0;
	#1 $display("%b & %b = %b", a, b, s);
			a=1; b=1;
	#1 $display("%b & %b = %b", a, b, s);
	end
	
endmodule // testandgate
