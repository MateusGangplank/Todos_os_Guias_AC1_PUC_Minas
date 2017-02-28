// ------------------------- 
// Exemplo0015 - or 
// Nome: Oswaldo Oliveira Paulino
// Matricula: 382175
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
	reg a,b,c; // definir registrador 
	wire s1, s; // definir conexao (fio) 
	
// ------------------------- instancia 
orgate OR1 (s1, a, b); 
orgate OR2 (s, s1, c);

// ------------------------- preparacao 
initial begin:start 
	a=0;
	b=0;
	c=0;
end 

// ------------------------- parte principal 
initial begin:main 
	$display("Exemplo0015 - Oswaldo Oliveira Paulino - 382175"); 
	$display("Test or gate"); 
	$display("\n a | b | c = s\n"); 
	$monitor(" %b | %b | %b = %b", a, b, c, s); 
	#1 a=0; b=0; c=0;
	#1 a=0; b=0; c=1;
	#1 a=0; b=1; c=0;
	#1 a=0; b=1; c=1;
	#1 a=1; b=0; c=0;
	#1 a=1; b=0; c=1;
	#1 a=1; b=1; c=0;
	#1 a=1; b=1; c=1;
end 

endmodule // testorgate 


// ------------------------------ documentacao complementar
/*
    Exemplo0015 - Oswaldo Oliveira Paulino - 382175
    Test or gate
    
     a | b | c = s
    
     0 | 0 | 0 = 0
     0 | 0 | 1 = 1
     0 | 1 | 0 = 1
     0 | 1 | 1 = 1
     1 | 0 | 0 = 1
     1 | 0 | 1 = 1
     1 | 1 | 0 = 1
     1 | 1 | 1 = 1
*/