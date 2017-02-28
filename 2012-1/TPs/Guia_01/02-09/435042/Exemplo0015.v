// --------------------- 
// Exemplo0015 - OR3 
// Nome: Daniel Telles McGinnis 
// Matricula: 435042
// --------------------- 
// Previs�o:
// A sa�da � a disjun��o das 3 entradas.
// Teste 1:
// Entradas: (a=0, b=0 e c=0), (a=0, b=0 e c=1), (a=0, b=1 e c=0), (a=0, b=1 e c=1),
// (a=1, b=0 e c=0), (a=1, b=0 e c=1), (a=1, b=1 e c=0) e (a=1, b=1 e c=1)
// Observa��es da sa�da:
// A sa�da � uma tabela verdade da disjun��o de 3 entradas.
// --------------------- 
// -- or3 gate 
// --------------------- 

module or2gate(output s, input p, input q);
	assign s = (p | q);
endmodule // or2gate

module or3gate (output s, input p, input q, input r); 
	wire t;
	or2gate OR2_1 (t, p, q);
	or2gate OR2_2 (s, t, r);
endmodule // or3 gate
// --------------------- 
// -- test or3gate 
// --------------------- 
module testor3gate; 
	// ------------------------- dados locais 
	reg a, b, c; // definir registrador 
	wire s;      // definir conexao (fio) 
	// ------------------------- instancia 
	or3gate OR3_1 (s, a, b, c); 
	// ------------------------- preparacao 
	initial begin:start 
		a=0;
		b=0;
		c=0;
	end 
	// ------------------------- parte principal 
	initial begin:main 
		$display("Exemplo0015 - Daniel Telles McGinnis - 435042"); 
		$display("Test or3 gate"); 
		$display("a | b | c = s\n");
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