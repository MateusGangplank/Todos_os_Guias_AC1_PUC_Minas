// ------------------------- 
// Exemplo0014 - AND 
// Nome: Rafael Santos Moura
// Matricula: 441705
// ------------------------- 

// --------------------- 
// -- and gate 
// --------------------- 

	module andgate (output s, input p, input q); 
	assign s = p & q; 
	endmodule // and

// --------------------- 
// -- test andgate 
// --------------------- 

	module testandgate; 

// ------------------------- dados locais 
	reg a,b,c,d; // definir registrador 
	wire s1, s2, s; // definir conexao (fio) 
	
// ------------------------- instancia 
	andgate AND1 (s1, a, b); 
	andgate AND2 (s2, s1, c);
	andgate AND3 (s, s2, d);

// ------------------------- preparacao 
	initial begin:start 
	a=0;
	b=0;
	c=0;
	d=0;
end 

// ------------------------- parte principal 
	initial begin:main 
	$display("Exemplo0014 - Rafael Santos Moura - 441705"); 
	$display("Test and gate"); 
	$display("\n a & b & c & d = s\n"); 
	$monitor(" %b & %b & %b & %b = %b", a, b, c, d, s); 
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

endmodule // testandgate 

