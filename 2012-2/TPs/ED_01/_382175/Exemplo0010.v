// ------------------------- 
// Exemplo0010 - nor 
// Nome: Oswaldo Oliveira Paulino
// Matricula: 382175
// ------------------------- 

// --------------------- 
// -- nor gate 
// --------------------- 

module norgate (output s, input p, input q); 
	assign s = ~p & ~q; 
endmodule // nor

// --------------------- 
// -- test norgate 
// --------------------- 

module testnorgate; 

// ------------------------- dados locais 
	reg a,b; // definir registrador 
	wire s; // definir conexao (fio) 
	
// ------------------------- instancia 
norgate NOR1 (s, a, b); 

// ------------------------- preparacao 
initial begin:start 
	a=0;
	b=0;
end 

// ------------------------- parte principal 
initial begin:main 
	$display("Exemplo0010 - Oswaldo Oliveira Paulino - 382175"); 
	$display("Test nor gate"); 
	$display("\n a' & b' = s\n"); 
	$monitor(" %b & %b = %b", a, b, s); 
	#1 a=0; b=0; 
	#1 a=0; b=1; 
	#1 a=1; b=0; 
	#1 a=1; b=1; 
end 

endmodule // testnorgate 

// ------------------------------ documentacao complementar
/*
    Exemplo0010 - Oswaldo Oliveira Paulino - 382175
    Test nor gate
    
     a' & b' = s
    
     0 & 0 = 1
     0 & 1 = 0
     1 & 0 = 0
     1 & 1 = 0
*/