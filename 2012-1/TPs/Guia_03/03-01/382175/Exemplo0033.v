// ------------------------- 
// Exemplo0033 - F4 
// Nome: Oswaldo Oliveira Paulino
// Matricula: 382175
// ------------------------- 

// ------------------------- 
// f4_gate 
// ------------------------- 

module Q03 (output s0, output s1, input a, input b, input CH);
	wire ANDab, NANDab, ORab, NORab, n0, n1, AND01, AND02, AND03, AND04;
	and AAB(ANDab, a, b);
	nand NAAB(NANDab, a, b);
	or OAB(ORab, a, b);
	nor NOAB(NORab, a, b);
	not N0(n0, CH);
	not N1(n1, CH);
	and AND1(AND01, ANDab, n0);
	and AND2(AND02, NANDab, CH);
	and AND3(AND03, ORab, n1);
	and AND4(AND04, NORab, CH);
	or  OR01(s0, AND1, AND2);
	or  OR02(s1, AND3, AND4);
endmodule

module test_f4; 
// ------------------------- definir dados 
	reg 	a, b;
	reg 	ch;
	wire 	s0, s1;
	
	Q03 CIRC03(s0, s1, a, b, ch);
	
initial begin:start
	a = 0;
	b = 0;
	ch = 0;  
end 
// ------------------------- parte principal 
initial begin 
	$display("Exemplo0033 - Oswaldo Oliveira Paulino - 382175"); 
	$display("Test LU's module"); 
	$monitor("%b %b = %b %b", a, b, s0, s1); 
	$display("Valor da chave 0");
		
	#1
	a = 0; b = 0; ch = 0;
	#1
	a = 0; b = 1; ch = 0;
	#1
	a = 1; b = 0; ch = 0;
	#1
	a = 1; b = 1; ch = 0;
	#1
	a = 0; b = 0; ch = 1;
		
	$display("\nValor da chave 1");
	$monitor("%b %b = %b %b", a, b, s0, s1);
	#1
	a = 0; b = 0; ch = 1;
	#1
	a = 0; b = 1; ch = 1;
	#1
	a = 1; b = 0; ch = 1;
	#1
	a = 1; b = 1; ch = 1;
end 

endmodule // test_f4 

// -------------------------- Documentacao complementar
/*

*/