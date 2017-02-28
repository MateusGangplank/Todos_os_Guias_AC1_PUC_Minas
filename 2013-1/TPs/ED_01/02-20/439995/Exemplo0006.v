// ------------------------- 
// Exemplo0006 - NAND 
// Nome: Thauan Velasco 
// Matricula: 439995
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
	$display("Exemplo0006 - Thauan Velasco - 439995"); 
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
