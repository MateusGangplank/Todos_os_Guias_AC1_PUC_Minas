// ------------------------- 
// Exemplo0008 - XNOR
// Nome: Rafael Santos Moura 
// Matricula: 441705 
// ------------------------- 
// --------------------- 
// -- xnor gate 
// --------------------- 
	module xnorgate (output s, input p, input q); 
	assign s = ~(p ^ q); 
	endmodule // xnor
// --------------------- 
// -- test xnorgate 
// --------------------- 
	module testxnorgate; 
// ------------------------- dados locais 
	reg a,b; // definir registrador 
	wire s; // definir conexao (fio) 
// ------------------------- instancia 
	xnorgate XNOR1 (s, a, b); 
// ------------------------- preparacao 
	initial begin:start 
	a=0;
	b=0;

end 

// ------------------------- parte principal 
	initial begin:main 
	$display("Exemplo0008 - Rafael Santos Moura - 441705"); 
	$display("Test xnor gate"); 
	$display("\n (a ^ b)' = s\n"); 
	$monitor("%b ^ %b = %b", a, b, s); 
	#1 a=0; b=0; 
	#1 a=0; b=1; 
	#1 a=1; b=0; 
	#1 a=1; b=1; 

end 

endmodule // testnorgate 