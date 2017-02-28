// ------------------------- 
// Exemplo0006 - nand 
// Nome: Oswaldo Oliveira Paulino
// Matricula: 382175
// ------------------------- 

// --------------------- 
// -- nand gate 
// --------------------- 

module nandgate (output s, input p, input q); 
	assign s = ~(p & q); 
endmodule // nand

// --------------------- 
// -- test nandgate 
// --------------------- 

module testnandgate; 

// ------------------------- dados locais 
	reg a,b; // definir registrador 
	wire s; // definir conexao (fio) 
	
// ------------------------- instancia 
nandgate NAND1 (s, a, b); 

// ------------------------- preparacao 
initial begin:start 
	a=0;
	b=0;
end 

// ------------------------- parte principal 
initial begin:main 
	$display("Exemplo0006 - Oswaldo Oliveira Paulino - 382175"); 
	$display("Test nand gate"); 
	$display("\n a' | b' = s\n"); 
	a=0; b=0; 
	#1 $display("%b | %b = %b", a, b, s); 
	a=0; b=1; 
	#1 $display("%b | %b = %b", a, b, s); 
	a=1; b=0; 
	#1 $display("%b | %b = %b", a, b, s); 
	a=1; b=1; 
	#1 $display("%b | %b = %b", a, b, s); 
end 

endmodule // testnandgate 

// ------------------------------ documentacao complementar
/*
    Exemplo0006 - Oswaldo Oliveira Paulino - 382175
    Test nand gate
    
    a' | b' = s
    
    0 | 0 = 1
    0 | 1 = 1
    1 | 0 = 1
    1 | 1 = 0
*/