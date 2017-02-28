// -------------------------
// Exemplo0004 - OR
// Nome: Pedro Henrique Alves M. de Carvalho
// Matricula: 427452
// -------------------------

// -------------------------
// -- or gate
// -------------------------
module orgate (output s, input p, q);
 assign s = p | q;
endmodule // fim do orgate

// -------------------------
// -- test or gate
// -------------------------
module testorgate;
// ------------------------- dados locais
	reg a, b;	// definir registrador
	wire s;	// definir conexao (fio)
// ------------------------- instancia
 orgate OR1 (s, a, b);
// ------------------------- preparacao
 initial begin:start
	a=0; b=0;
 end
 
// ------------------------- parte principal
 initial begin:main
			// execucao unitaria
	$display("Exemplo 0004 - Pedro Henrique A. M. de Carvalho - 427452");
	$display("Test OR gate");
	$display("\na | b = s\n");		// Alterei o simbolo de ADN (&) para o de OR (|) ficando diferente do pdf
	a=0; b=0;
 #1 $display("%b | %b = %b", a, b, s);
	a=0; b=1;
 #1 $display("%b | %b = %b", a, b, s);
	a=1; b=0;
 #1 $display("%b | %b = %b", a, b, s);
	a=1; b=1;
 #1 $display("%b | %b = %b", a, b, s);
 end

endmodule // testorgate