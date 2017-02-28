// Exemplo0016 - BASE_NUMERICA_OPERACOES - Exercicio01
// Nome: Tiago Moreira
// Matricula: 438948

// -- test number system

module test_base_06;

// ---- dados locais
//registradores para os operandos
reg [5:0]a;
reg [5:0]b;
reg [5:0]c;
reg [5:0]d;

reg [4:0]s1; //registrador para a saida
reg [3:0]s2;
	
// ---- parte principal

initial
	begin
	
	//execucao unitaria
	$display ("Exemplo0016 - Tiago Moreira - 438948");
	$display ("Operacoes na base decimal\nExercicio01\n\na.)");
	
	a = 2;
	b = 14;
	s1 = a+b;
	
	$display("%d + %d = %b\n\nb.)",a,b,s1);
	
	a = 3;
	b = 7;
	s1 = a*b;
	
	$display("%d * %d = %b\n\nc.)",a,b,s1);
	
	a = 34;
	b = 3;
	s2 = a/b;
	
	$display("%d / %d = %b\n\nd.)",a,b,s2);
	
	a = 19;
	b = 11;
	s2 = a-b;
	
	$display("%d - %d = %b\n\ne.)",a,b,s2);
	
	a = 2;
	b = 4;
	c = 6;
	d = 1;
	
	s2 = a*b+c-d;
	
	$display("%d * %d + %d - %d = %b",a,b,c,d,s2);
	
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