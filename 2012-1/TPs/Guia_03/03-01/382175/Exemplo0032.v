// ------------------------- 
// Exemplo0032 - F4 
// Nome: Oswaldo Oliveira Paulino
// Matricula: 382175
// ------------------------- 

// ------------------------- 
// f4_gate 
// ------------------------- 

module Q02 (output ac, output bd, input a, input b, input c, input d, input CH);
	wire ANDac, ORac, ANDbd, ORbd, n0, n1, s0, s1, s2, s3;
	and AAC(ANDac, a, c);
	or  OAC(ORac, a, c);
	and ABD(ANDbd, b, d);
	or  OBD(ORbd, b, d);
	not N0(n0, CH);
	not N1(n1, CH);
	and ANDs0(s0, ANDac, CH);
	and ANDs1(s1, ORac, n0);
	and ANDs2(s2, ANDbd, CH);
	and ANDs3(s3, ORbd, n1);
	or  s0s1(ac, s0, s1);
	or  s2s3(bd, s2, s3);
endmodule

module test_f4; 
// ------------------------- definir dados 
	reg 	a, b, c, d;
	reg 	ch;
	wire 	s0, s1;
	
	Q02 CIRC02(s0, s1, a, b, c, d, ch);
	
initial begin:start
	a = 0;
	b = 0;
	c = 0;
	d = 0;
	ch = 0;  
end 
// ------------------------- parte principal 
initial begin 
	$display("Exemplo0032 - Oswaldo Oliveira Paulino - 382175"); 
	$display("Test LU's module"); 
	$monitor("%b%b || %b%b = %b%b", a, b, c, d, s0, s1); 
	$display("Valor da chave 0");
		
	#1
	a = 0; b = 0; c = 0; d = 0; ch = 0;
	#1
	a = 0; b = 0; c = 0; d = 1; ch = 0;
	#1
	a = 0; b = 0; c = 1; d = 0; ch = 0;
	#1
	a = 0; b = 0; c = 1; d = 1; ch = 0;
	#1
	a = 0; b = 1; c = 0; d = 0; ch = 0;
	#1
	a = 0; b = 1; c = 0; d = 1; ch = 0;
	#1
	a = 0; b = 1; c = 1; d = 0; ch = 0;		
	#1
	a = 0; b = 1; c = 1; d = 1; ch = 0;
	#1
	a = 1; b = 0; c = 0; d = 0; ch = 0;
	#1
	a = 1; b = 0; c = 0; d = 1; ch = 0;
	#1
	a = 1; b = 0; c = 1; d = 0; ch = 0;
	#1
	a = 1; b = 0; c = 1; d = 1; ch = 0;
	#1
	a = 1; b = 1; c = 0; d = 0; ch = 0;
	#1
	a = 1; b = 1; c = 0; d = 1; ch = 0;
	#1
	a = 1; b = 1; c = 1; d = 0; ch = 0;
	#1
	a = 1; b = 1; c = 1; d = 1; ch = 0;
	#1
	a = 0; b = 0; c = 0; d = 0; ch = 1;
		
	$display("\nValor da chave 1");
	$monitor("%b%b & %b%b = %b%b", a, b, c, d, s0, s1);
	#1
	a = 0; b = 0; c = 0; d = 1; ch = 1;
	#1
	a = 0; b = 0; c = 1; d = 0; ch = 1;
	#1
	a = 0; b = 0; c = 1; d = 1; ch = 1;
	#1
	a = 0; b = 1; c = 0; d = 0; ch = 1;
	#1
	a = 0; b = 1; c = 0; d = 1; ch = 1;
	#1
	a = 0; b = 1; c = 1; d = 0; ch = 1;		
	#1
	a = 0; b = 1; c = 1; d = 1; ch = 1;
	#1
	a = 1; b = 0; c = 0; d = 0; ch = 1;
	#1
	a = 1; b = 0; c = 0; d = 1; ch = 1;
	#1
	a = 1; b = 0; c = 1; d = 0; ch = 1;
	#1
	a = 1; b = 0; c = 1; d = 1; ch = 1;
	#1
	a = 1; b = 1; c = 0; d = 0; ch = 1;
	#1
	a = 1; b = 1; c = 0; d = 1; ch = 1;
	#1
	a = 1; b = 1; c = 1; d = 0; ch = 1;
	#1
	a = 1; b = 1; c = 1; d = 1; ch = 1;
end 

endmodule // test_f4 

// -------------------------- Documentacao complementar
/*
    Exemplo0032 - Oswaldo Oliveira Paulino - 382175
    Test LU's module
    Valor da chave 0
    00 || 00 = 00
    00 || 01 = 01
    00 || 10 = 10
    00 || 11 = 11
    01 || 00 = 01
    01 || 01 = 01
    01 || 10 = 11
    01 || 11 = 11
    10 || 00 = 10
    10 || 01 = 11
    10 || 10 = 10
    10 || 11 = 11
    11 || 00 = 11
    11 || 01 = 11
    11 || 10 = 11
    11 || 11 = 11
    
    Valor da chave 1
    00 & 00 = 00
    00 & 01 = 00
    00 & 10 = 00
    00 & 11 = 00
    01 & 00 = 00
    01 & 01 = 01
    01 & 10 = 00
    01 & 11 = 01
    10 & 00 = 00
    10 & 01 = 00
    10 & 10 = 10
    10 & 11 = 10
    11 & 00 = 00
    11 & 01 = 01
    11 & 10 = 10
    11 & 11 = 11
*/