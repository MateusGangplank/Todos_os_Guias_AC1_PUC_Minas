// Exemplo0020 - COMPLEMENTO DE 2 EXIBIDO EM OUTRAS BASES - Exercicio05
// Nome: Tiago Moreira
// Matricula: 438948

// -- test number system

module test_base_10;

// ---- dados locais
//registradores para os operandos
reg [7:0]a = ~(5'b10001)+1;
reg [6:0]b = ~(6'o64)+1;
reg [5:0]c = ~(4'd14)+1;
reg [4:0]d = ~(8'hC4)+1;
reg [3:0]e = ~(28-35)+1;
	
// ---- parte principal

initial
	begin
	
	//execucao unitaria
	$display ("Exemplo0020 - Tiago Moreira - 438948");
	$display ("Complemento de 2 exibido em outras bases\nExercicio05\n\n");
	
	$display ("a.)Decimal: %d\nb.)Octal: %o\nc.)Hexadecimal %h\nd.)Octal: %o\ne.)Hexadecimal: %h",a,b,c,d,e);
	
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
// Exemplo0018			11/08/2011		Esboco Teste de base numerica - complemento de 1
// Exemplo0019			11/08/2011		Esboco Teste de base numerica - complemento de 2
// Exemplo0020			11/08/2011		Esboco Teste de base numerica - complemento de 2 exibido em outras bases
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
//
//	Exemplo0018
//		Complemento de 1
//		Exercicio03
//		a.)011000
//		b.)010011
//		c.)0010
//		d.)00100
//		e.)010
//
//	Exemplo0019
//		Complemento de 2
//		Exercicio04
//		a.)11001011
//		b.)1010111
//		c.)110101
//		d.)01101
//		e.)0110
//
//	Exemplo0020
//		Complemento de 2 exibido em outras bases
//		Exercicio05
//		a.)Decimal: 239
//		b.)Octal: 114
//		c.)Hexadecimal: 32
//		d.)Octal: 34
//		e.)Hexadecimal: 7