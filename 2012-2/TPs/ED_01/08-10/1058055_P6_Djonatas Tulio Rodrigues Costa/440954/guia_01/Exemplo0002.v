// -------------------------
// Exemplo0002 - NOT
// Nome: Djonatas Tulio Rodrigues Costa
// Matricula: 440954
// -------------------------

// -------------------------
// -- not gate
// -------------------------
module notgate (output s, input p);
	assign s = ~p;
endmodule // notgate

// -------------------------
// -- test not gate
// -------------------------
module testnotgate;
// ------------------------- dados locais
	reg a;	// definir registrador
		// (variavel independente)
	wire s;	// definir conexao (fio)
		// (variavel dependente)
// ------------------------- instancia
	notgate NOT1 (s, a);
// ------------------------- preparacao
	initial begin:start
		a=0;
	end
// ------------------------- parte principal
	initial begin
		$display("Exemplo0002 - Djonatas Tulio Rodrigues Costa - 440954");
		$display("Test NOT gate");
		$display("\n~a = s\n");
			a=0;
	#1 $display("~%b = %b", a, s);
			a=1;
	#1 $display("~%b = %b", a, s);
	end
	
endmodule // testnotgate
