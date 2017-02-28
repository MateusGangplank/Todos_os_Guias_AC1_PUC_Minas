// -------------------------
// Exemplo0003 - AND
// Nome: Pedro Henrique Alves M. de Carvalho
// Matricula: 427452
// -------------------------

// -------------------------
// -- and gate
// -------------------------
module andgate (output s, input p, input q);  // Agora eu tenho uma entrada amais
 assign s = p & q;
endmodule // fim do andgate

// -------------------------
// -- test and gate
// -------------------------
module testbuffer;
// ------------------------- dados locais
	reg a, b;	// definir registrador
	wire s;	// definir conexao (fio)
// ------------------------- instancia
 andgate AND1 (s, a, b);
// ------------------------- preparacao
 initial begin:start
	a=0; b=0;
 end
 
// ------------------------- parte principal
 initial begin:main
			// execucao unitaria
	$display("Exemplo 0003 - Pedro Henrique A. M. de Carvalho - 427452");
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