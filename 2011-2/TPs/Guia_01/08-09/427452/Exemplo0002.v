// -------------------------
// Exemplo0002 - NOT
// Nome: Pedro Henrique Alves M. de Carvalho
// Matricula: 427452
// -------------------------

// -------------------------
// -- not gate
// -------------------------
module notgate (output s, input p);  // parete alterada para notgate
 assign s = ~p;	// erro pos nao tinha coocado a negação (~)
endmodule	// notgate (ou como eu gosto de colocar 'fim do notgate')

// -------------------------
// -- test not gate
// -------------------------
module testbuffer;
// ------------------------- dados locais
	reg a;	// definir registrador
				// (variavel independente)
	wire s;	// definir conexao (fio)
				// (variavel dependente)
// ------------------------- instancia
 notgate NOT1 (s, a);
// ------------------------- preparacao
 initial begin:start
	a=0;  // define qua a variavel a inicia com valor 0
 end
// ------------------------- parte principal
 initial begin:main
			// execucao unitaria
	$display("Exemplo 0002 - Pedro Henrique A. M. de Carvalho - 427452");
	$display("Test NOT gate");
	$display("\n~a = s\n");
	a=0;
 #1 $display("~%b=%b", a, s);
 	a=1;
 #1 $display("~%b=%b", a, s);
 end

endmodule // testbuffer