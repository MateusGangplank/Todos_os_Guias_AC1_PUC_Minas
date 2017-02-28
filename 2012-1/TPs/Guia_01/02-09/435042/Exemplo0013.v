// --------------------- 
// Exemplo0013 - AND3 
// Nome: Daniel Telles McGinnis 
// Matricula: 435042
// --------------------- 
// Previsão:
// A saída é a conjunção das 3 entradas.
// Teste 1:
// Entradas: (a=0, b=0 e c=0), (a=0, b=0 e c=1), (a=0, b=1 e c=0), (a=0, b=1 e c=1),
// (a=1, b=0 e c=0), (a=1, b=0 e c=1), (a=1, b=1 e c=0) e (a=1, b=1 e c=1)
// Observações da saída:
// A saída é uma tabela verdade da conjunção de 3 entradas.
// --------------------- 
// -- and3 gate 
// --------------------- 
module and3gate (output s, input p, input q, input r); 
	assign s = (p & q & r); 
endmodule // and3 gate
// --------------------- 
// -- test and3gate 
// --------------------- 
module testand3gate; 
	// ------------------------- dados locais 
	reg a, b, c; // definir registrador 
	wire s;      // definir conexao (fio) 
	// ------------------------- instancia 
	and3gate AND3_1 (s, a, b, c); 
	// ------------------------- preparacao 
	initial begin:start 
		a=0;
		b=0;
		c=0;
	end 
	// ------------------------- parte principal 
	initial begin:main 
		$display("Exemplo0013 - Daniel Telles McGinnis - 435042"); 
		$display("Test and3 gate"); 
		$display("a & b & c = s\n");
		$display("a   b   c   s");
		$monitor("%b   %b   %b   %b", a, b, c, s);
		#1 a=0; b=0; c=1;
		#1 a=0; b=1; c=0;
		#1 a=0; b=1; c=1;
		#1 a=1; b=0; c=0;
		#1 a=1; b=0; c=1;
		#1 a=1; b=1; c=0;
		#1 a=1; b=1; c=1;
	end 
endmodule // testand3gate 