// Exemplo0025 - F4
// Nome: Tiago Moreira
// Matricula: 438948

// -- f4_gate

module f4_gate(output [3:0]s0, output [3:0]s1, output [3:0]s2, output [3:0]s3,
					output [3:0]s4, output [3:0]s5, output [3:0]s6, output [3:0]s7,
					input [3:0]a, input [3:0]b);
					
//bit a bit
//porta not a
	not n1(s0[0],a[0]);
	not n2(s0[1],a[1]);
	not n3(s0[2],a[2]);
	not n4(s0[3],a[3]);

//porta not b	
	not n5(s1[0],b[0]);
	not n6(s1[1],b[1]);
	not n7(s1[2],b[2]);
	not n8(s1[3],b[3]);
	
//porta or
	or o1(s2[0],a[0],b[0]);
	or o2(s2[1],a[1],b[1]);
	or o3(s2[2],a[2],b[2]);
	or o4(s2[3],a[3],b[3]);

//porta nor
	nor no1(s3[0],a[0],b[0]);
	nor no2(s3[1],a[1],b[1]);
	nor no3(s3[2],a[2],b[2]);
	nor no4(s3[3],a[3],b[3]);

//porta and
	and a1(s4[0],a[0],b[0]);
	and a2(s4[1],a[1],b[1]);
	and a3(s4[2],a[2],b[2]);
	and a4(s4[3],a[3],b[3]);
		
//porta nand
	nand na1(s5[0],a[0],b[0]);
	nand na2(s5[1],a[1],b[1]);
	nand na3(s5[2],a[2],b[2]);
	nand na4(s5[3],a[3],b[3]);
	
//porta xor
	xor xo1(s6[0],a[0],b[0]);
	xor xo2(s6[1],a[1],b[1]);
	xor xo3(s6[2],a[2],b[2]);
	xor xo4(s6[3],a[3],b[3]);

//porta xnor
	xnor xn1(s7[0],a[0],b[0]);
	xnor xn2(s7[1],a[1],b[1]);
	xnor xn3(s7[2],a[2],b[2]);
	xnor xn4(s7[3],a[3],b[3]);
		
endmodule //f4

module testf4;

// ---- dados locais

reg [3:0]a;
reg [3:0]b;
wire [3:0]s0;
wire [3:0]s1;
wire [3:0]s2;
wire [3:0]s3;
wire [3:0]s4;
wire [3:0]s5;
wire [3:0]s6;
wire [3:0]s7;

	f4_gate AUX(s0,s1,s2,s3,s4,s5,s6,s7,a,b);	

initial
	begin
	a = 4'b0000;	b = 4'b0000;
	end
// ---- parte principal

initial
	begin
	
	//execucao unitaria
	$display ("Exemplo0025 - Tiago Moreira - 438948");
	$display ("Test LU's module\n");
	$display ("a\tb\t~a\t~b\ta|b\t~(a|b)\ta&b\t~(a&b)\ta^b\t~(a^b)");

	#1		$display ("%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b",a,b,s0,s1,s2,s3,s4,s5,s6,s7);
	#1		a = 4'b0011;	b = 4'b0101;
	#1		$display ("%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b",a,b,s0,s1,s2,s3,s4,s5,s6,s7);
	#1		a = 4'b1111;	b = 4'b1111;
	#1		$display ("%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b",a,b,s0,s1,s2,s3,s4,s5,s6,s7);
	#1		a = 4'b1111;	b = 4'b0000;
	#1		$display ("%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b",a,b,s0,s1,s2,s3,s4,s5,s6,s7);
	#1		a = 4'b0110;	b = 4'b1010;
	#1		$display ("%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b\t%b",a,b,s0,s1,s2,s3,s4,s5,s6,s7);
		
	end
endmodule //testf4

// -- Documentacao complementar
 
/*
 		Historico
 Nome						Data				Modificacao
 Exemplo0021			23/08/2011		Esboco Modulo com Descricao de circuito usando portas nativas(AND,OR)
 Exemplo0022			23/08/2011		Esboco Modulo com Descricao de circuito usando portas nativas(AND,OR),selecionavel
 Exemplo0023			23/08/2011		Esboco Modulo com Descricao de circuito usando portas nativas(AND/OR,NAND/NOR),selecionavel
 Exemplo0024			23/08/2011		Esboco Modulo com Descricao de circuito usando portas nativas(OR/NOR,XOR/XNOR),selecionavel
 Exemplo0024			24/08/2011		Esboco Modulo com Descricao de circuito usando portas nativas(NOT,OR,NOR,AND,NAND,XOR/XNOR)
  
			Testes e Resultados

 Exemplo0021
 	Resultados esperados
	a			b			a&b		a|b
	0000		0000		0000		0000	ok
	0011		0101		0001		0111	ok
	1111		1111		1111		1111	ok
	1111		0000		0000		1111	ok
	0110		1010		0010		1110	ok

 Exemplo0022
 	Resultados esperados
chave		a			b			a|b
	0		0000		0000		0000	ok
	0		0011		0101		0111	ok
	0		1111		1111		1111	ok
	0		1111		0000		1111	ok
	0		0110		1010		1110	ok
									a&b
	1		0000		0000		0000	ok
	1		0011		0101		0001	ok
	1		1111		1111		1111	ok
	1		1111		0000		0000	ok
	1		0110		1010		0010	ok

 Exemplo0023
 	Resultados esperados
chave		a			b			a|b		a&b
	0		0000		0000		0000		0000	ok
	0		0011		0101		0111		0001	ok
	0		1111		1111		1111		1111	ok
	0		1111		0000		1111		0000	ok
	0		0110		1010		1110		0010	ok
									~(a|b)	~(a&b)
	1		0000		0000		1111		1111	ok
	1		0011		0101		1000		1110	ok
	1		1111		1111		0000		0000	ok
	1		1111		0000		0000		1111	ok
	1		0110		1010		0001		1101	ok
	
 Exemplo0024
 	Resultados esperados
chave		a			b			a|b		~(a|b)
	0		0000		0000		0000		1111	ok
	0		0011		0101		0111		1000	ok
	0		1111		1111		1111		0000	ok
	0		1111		0000		1111		0000	ok
	0		0110		1010		1110		0001	ok
									a^b		~(a^b)
	1		0000		0000		0000		1111	ok
	1		0011		0101		0110		1001	ok
	1		1111		1111		0000		1111	ok
	1		1111		0000		1111		0000	ok
	1		0110		1010		1100		0011	ok

 Exemplo0025
 	Resultados esperados
	a			b			~a		~b			a|b	~(a|b)	a&b	~(a&b)	a^b	~(a^b)
	0000		0000		1111	1111		0000	  1111	0000	  1111	0000	  1111	ok
	0011		0101		1100	1010		0111	  1000	0001	  1110	0110	  1001	ok
	1111		1111		0000	0000		1111	  0000	1111	  0000	0000	  1111	ok
	1111		0000		0000	1111		1111	  0000	0000	  1111	1111	  0000	ok
	0110		1010		1001	0101		1110	  0001	0010	  1101	1100	  0011	ok
*/