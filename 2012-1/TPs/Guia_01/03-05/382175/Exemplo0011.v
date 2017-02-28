// ------------------------- 
// Exemplo0011 - xor 
// Nome: Oswaldo Oliveira Paulino
// Matricula: 382175
// ------------------------- 

// --------------------- 
// -- xor gate 
// --------------------- 

module xorgate (output s, input p, input q); 
	assign s = (~p & q) | (p & ~q); 
endmodule // xor

// --------------------- 
// -- test xorgate 
// --------------------- 

module testxorgate; 

// ------------------------- dados locais 
	reg a,b; // definir registrador 
	wire s; // definir conexao (fio) 
	
// ------------------------- instancia 
xorgate NOR1 (s, a, b); 

// ------------------------- preparacao 
initial begin:start 
	a=0;
	b=0;
end 

// ------------------------- parte principal 
initial begin:main 
	$display("Exemplo0011 - Oswaldo Oliveira Paulino - 382175"); 
	$display("Test xor gate"); 
	$display("\n a ^ b = s\n"); 
	$monitor(" %b ^ %b = %b", a, b, s); 
	#1 a=0; b=0; 
	#1 a=0; b=1; 
	#1 a=1; b=0; 
	#1 a=1; b=1; 
end 

endmodule // testxorgate 


// ------------------------------ documentacao complementar
/*
    Exemplo0011 - Oswaldo Oliveira Paulino - 382175
    Test xor gate
    
     a ^ b = s
    
     0 ^ 0 = 0
     0 ^ 1 = 1
     1 ^ 0 = 1
     1 ^ 1 = 0
*/