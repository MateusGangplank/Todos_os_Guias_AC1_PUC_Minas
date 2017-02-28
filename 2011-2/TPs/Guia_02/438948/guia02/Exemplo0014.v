// Exemplo0014 - BASE_NUMERICA
// Nome: Tiago Moreira
// Matricula: 438948

// -- test number system

module test_base_04;

// ---- dados locais

reg [2:0]a;
reg [3:0]b;
reg [4:0]c;
reg [4:0]d;
	
// ---- parte principal

initial
	begin
	
	//execucao unitaria
	$display ("Exemplo0014 - Tiago Moreira - 438948");
	$display ("Test Number System");
	
	a = 5;
	b = 10;
	c = 15;
	d = 20;
	
	$display("\nPositive value");
	$display("a = %d = %3b",a,a);
	$display("b = %d = %4b",a,a);
	$display("c = %d = %5b",a,a);
	
	$display("b = %d = %4b",b,b);
	$display("c = %d = %5b",c,c);
	$display("d = %d = %5b",d,d);
	$display("d = %d = %5o",d,d);
	$display("d = %d = %5h",d,d);
	
	a = -5;
	b = -5;
	c = -5;
	
	$display("\nNegative value");
	$display("a = -5 [3 bits]= %d = %3b",a,a);
	$display("b = -5 [4 bits]= %d = %4b",b,b);
	$display("c = -5 [5 bits]= %d = %5b",c,c);
	
	a = ~5+1;
	b = ~5+1;
	c = ~5+1;
	
	$display("\nNegative mixed expression");
	$display("a = %d = %3b",a,a);
	$display("b = %d = %4b",b,b);
	$display("c = %d = %5b",c,c);
	
	a = 5+3;
	b = 5+3;
	c = 10-5+25+3+1;
	
	$display("\nOverflow");
	$display("a (5+3)= %d = %3b",a,a);
	$display("b (5+3)= %d = %4b",b,b);
	$display("c (10-5+25+3+1)= %d = %5b",c,c);
	
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