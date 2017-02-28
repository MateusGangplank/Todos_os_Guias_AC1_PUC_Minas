// Exemplo0017 - BASE_NUMERICA_OPERACOES - Exercicio02
// Nome: Tiago Moreira
// Matricula: 438948

// -- test number system

module test_base_07;

// ---- dados locais
//registradores para os operandos
reg [5:0]a1;
reg [4:0]a2;

reg [4:0]b1;
reg [4:0]b2;

reg [9:0]c1;
reg [7:0]c2;

reg [9:0]d1;
reg [8:0]d2;

reg [5:0]e1;
reg [5:0]e2;
reg [7:0]e3;

reg [5:0]sa; //registrador para a saida
reg [5:0]sb;
reg [3:0]sc;
reg [6:0]sd;
reg [5:0]se;
	
// ---- parte principal

initial
	begin
	
	//execucao unitaria
	$display ("Exemplo0017 - Tiago Moreira - 438948");
	$display ("Operacoes em varias bases - resultados em binario\nExercicio02\n\na.)");
	
	a1 = 6'b100010;
	a2 = 5'b11010;
	sa = a1+a2;
	
	$display("Binario e binario: %b + %b = %b\n\nb.)",a1,a2,sa);
	
	b1 = 5'b11010;
	b2 = 5'o23;
	sb = b1+b2;
	
	$display("Binario e octal: %b + %o = %b\n\nc.)",b1,b2,sb);
	
	c1 = 10'o1234;
	c2 = 6'h2D;
	sc = c1/c2;
	
	$display("Octal e hexadecimal: %o / %h = %b\n\nd.)",c1,c2,sc);
	
	d1 = 9'h1A9;
	d2 = 9'b101101001;
	sd = d1-d2;
	
	$display("Hexadeximal e binario: %h - %b = %b\n\ne.)",d1,d2,sd);
	
	e1 = 5'o25;
	e2 = 6'o41;
	e3 = 7'h6B;
	
	se = e1*e2+e3;
	
	$display("Octal, octal e hexadecimal: %o * %o + %h = %b",e1,e2,e3,se);
	
	end
endmodule //test_base

// -- Documentacao complementar
// 
// 		Historico
// Nome					Data				Modificacao
// Exemplo0011			06/08/2011		Esboco Teste de base numerica
// Exemplo0012			06/08/2011		Esboco Teste de base numerica - numeros negativos
// Exemplo0013			07/08/2011		Esboco Teste de base numerica - numeros negativos usando o operador "~" complemento de 1
// Exemplo0014			07/08/2011		Esboco Teste de base numerica - transbordamento (overflow)
// Exemplo0015			07/08/2011		Esboco Teste de base numerica - exibicao de numeros em complementos
// Exemplo0016			11/08/2011		Esboco Teste de base numerica - operacoes na base decimal
// Exemplo0017			11/08/2011		Esboco Teste de base numerica - operacoes em varias bases
//
//			Testes e Resultados
//
// Exemplo0011
//		Positive value
//		a = 5 = 101
//		b = 5 =  101
//		c = 5 =   101
//		b = 10 = 1010
//		c = 15 = 01111
//		d = 20 = 10100
//		d = 20 =    24
//		d = 20 =    14
//
// Exemplo0012
//		Negative value
//		a = -5 [3 bits]= 3 = 011 (*obs: -5 em binario, com 3 bits, representa o numero 3: complemento de 2.)
//		b = -5 [4 bits]= 11 = 1011 (*obs: -5 em binario, com 4 bits, representa o numero 11: complemento de 2.)
//		c = -5 [5 bits]= 27 = 11011
//
//	Exemplo0013
//		Negative mixed expression
//		a = 2 = 010
//		b = 11 = 1011
//		c = 27 = 11011
//
//	Exemplo0014
//		Overflow
//		a (5+3)= 0 = 000
//		b (5+3)=  8 = 1000
//		c (10-5+25+3+1)=  2 = 00010
//
//	Exemplo0015
//		Complements
//		0 = -2 =   0 =  10
//		1 = -1 =  01 =   1
//		2 =  2 = 010 =  10
//
//	Exemplo0016
//		Operacoes na base decimal
//		Exercicio01
//		a.)2 + 14 = 10000
//		b.)3 *  7 = 10101
//		c.)34 /  3 = 1011
//		d.)19 - 11 = 1000
//		e.)2 *  4 +  6 -  1 = 1101
//
//	Exemplo0017
//		Operacoes em varias bases - resultados em binario
//		Exercicio02
//		a.)Binario e binario: 100010 + 11010 = 111100
//		b.)Binario e octal: 11010 + 23 = 101101
//		c.)Octal e hexadecimal: 1234 / 2d = 1110
//		d.)Hexadeximal e binario: 1a9 - 101101001 = 1000000
//		e.)Octal, octal e hexadecimal: 25 * 41 + 6b = 100000