// ------------------------- 
// Exemplo0015 - or 
// Nome: Rafael Santos Moura
// Matricula: 441705
// ------------------------- 

// --------------------- 
// -- or gate 
// --------------------- 
	module orgate (output s, input p, input q); 
	assign s = p | q; 
	endmodule // or

// --------------------- 
// -- test orgate 
// --------------------- 

	module testorgate; 

// ------------------------- dados locais 
	reg a,b,c,d; // definir registrador 
	wire s1, s2, s; // definir conexao (fio) 
	
// ------------------------- instancia 
	orgate OR1 (s1, a, b); 
	orgate OR2 (s2, s1, c);
	orgate OR3 (s, s2, d);

// ------------------------- preparacao 
	initial begin:start 
	a=0;
	b=0;
	c=0;
	d=0;
end 

// ------------------------- parte principal 
	initial begin:main 
	$display("Exemplo0015 - Rafael Santos Moura - 441705"); 
	$display("Test or gate"); 
	$display("\n a | b | c | d = s\n"); 
	$monitor(" %b | %b | %b | %b = %b", a, b, c, d, s); 
	#1 a=0; b=0; c=0; d=0;
	#1 a=0; b=0; c=0; d=1;
	#1 a=0; b=0; c=1; d=0;
	#1 a=0; b=0; c=1; d=1;
	#1 a=0; b=1; c=0; d=0;
	#1 a=0; b=1; c=0; d=1;
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

endmodule // testorgate 

