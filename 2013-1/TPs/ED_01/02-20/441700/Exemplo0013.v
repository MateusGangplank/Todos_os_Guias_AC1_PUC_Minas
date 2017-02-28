// ------------------------- 
// Exemplo0013 - AND
// Nome: Mateus Lara Carvalho 
// Matricula: 441700 
// ------------------------- 
// --------------------- 
// -- and gate 
// --------------------- 
	module andgate (output s, input n, input o, input p, input q); 
	assign s = n & o & p & q; 
	
	endmodule // and

// --------------------- 
// -- test andgate 
// --------------------- 
	module testandgate; 

// ------------------------- dados locais 
	reg a,b,c,d; // definir registrador 
	wire s; // definir conexao (fio) 
	
// ------------------------- instancia 
	andgate AND1 (s, a, b, c, d); 

// ------------------------- preparacao 
	initial begin:start 
	a=0;
	b=0;
	c=0;
	d=0;
end 

// ------------------------- parte principal 
	initial begin:main 
	$display("Exemplo0013 - Mateus Lara Carvalho - 441700"); 
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

