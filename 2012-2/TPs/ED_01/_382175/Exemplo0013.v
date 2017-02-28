// ------------------------- 
// Exemplo0013 - and 
// Nome: Oswaldo Oliveira Paulino
// Matricula: 382175
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
	$display("Exemplo0013 - Oswaldo Oliveira Paulino - 382175"); 
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


// ------------------------------ documentacao complementar
/*
    Exemplo0013 - Oswaldo Oliveira Paulino - 382175
    Test and gate
    
     a & b & c & d = s
    
     0 & 0 & 0 & 0 = 0
     0 & 0 & 0 & 1 = 0
     0 & 0 & 1 & 0 = 0
     0 & 0 & 1 & 1 = 0
     0 & 1 & 0 & 0 = 0
     0 & 1 & 0 & 1 = 0
     0 & 1 & 1 & 1 = 0
     1 & 0 & 0 & 0 = 0
     1 & 0 & 0 & 1 = 0
     1 & 0 & 1 & 0 = 0
     1 & 0 & 1 & 1 = 0
     1 & 1 & 0 & 0 = 0
     1 & 1 & 0 & 1 = 0
     1 & 1 & 1 & 0 = 0
     1 & 1 & 1 & 1 = 1
*/