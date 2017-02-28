// ------------------------- 
// Exemplo0009 - NAND 
// Nome: Mateus Lara Carvalho 
// Matricula: 441700 
// ------------------------- 
// --------------------- 
// -- nand gate 
// --------------------- 
	module nandgate (output s, input p, input q); 
	assign s = ~p | ~q; 
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
	$display("Exemplo0009 - Mateus Lara Carvalho - 441700"); 
	$display("Test nand gate"); 
	$display("\n a' | b' = s\n"); 
	$monitor(" %b | %b = %b", a, b, s); 
	#1 a=0; b=0; 
	#1 a=0; b=1; 
	#1 a=1; b=0; 
	#1 a=1; b=1; 

end 

endmodule // testnandgate 
