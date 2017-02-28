// --------------------- 
// Exemplo0010 - NOR 
// Nome: Daniel Telles McGinnis 
// Matricula: 435042
// --------------------- 
// Previs�o:
// A sa�da � a nega��o da disjun��o das entradas.
// Teste 1:
// Entradas: (a=0 e b=0), (a=0 e b=1), (a=1 e b=0) e (a=1 e b=1)
// Observa��es da sa�da:
// A sa�da � uma tabela verdade da nega��o da disjun��o.
// --------------------- 
// -- nor gate 
// --------------------- 
module norgate (output s, input p, input q); 
	assign s = (~p & ~q); 
endmodule // nor gate
// --------------------- 
// -- test norgate 
// --------------------- 
module testnorgate; 
	// ------------------------- dados locais 
	reg a, b; // definir registrador 
	wire s;   // definir conexao (fio) 
	// ------------------------- instancia 
	norgate NOR1 (s, a, b); 
	// ------------------------- preparacao 
	initial begin:start 
		a=0;
		b=0;
	end 
	// ------------------------- parte principal 
	initial begin:main 
		$display("Exemplo0010 - Daniel Telles McGinnis - 435042"); 
		$display("Test nor gate"); 
		$display("~(a | b) = s\n");
		$display("  a   b    s");
		$monitor("  %b   %b    %b", a, b, s);
		a=0; b=0;
		#1 a=0; b=1;
		#1 a=1; b=0;
		#1 a=1; b=1;
	end 
endmodule // testnorgate 