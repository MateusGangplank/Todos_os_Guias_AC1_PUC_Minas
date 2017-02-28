// Exemplo0024 - F4
// Nome: Tiago Moreira
// Matricula: 438948

// -- f4_gate

module f4_gate(output [3:0]s0, output [3:0]s1,
					input [3:0]a, input [3:0]b, input key);

//saidas intermediarias
wire s2;
wire [3:0]s3;
wire [3:0]s4;
wire [3:0]s5;
wire [3:0]s6;
wire [3:0]s7;
wire [3:0]s8;
wire [3:0]s9;
wire [3:0]s10;

//bit a bit
//porta or/nor
	or o1(s3[0],a[0],b[0]);
	or o2(s3[1],a[1],b[1]);
	or o3(s3[2],a[2],b[2]);
	or o4(s3[3],a[3],b[3]);

	nor no1(s4[0],a[0],b[0]);
	nor no2(s4[1],a[1],b[1]);
	nor no3(s4[2],a[2],b[2]);
	nor no4(s4[3],a[3],b[3]);
	
//porta xor/xnor
	xor xo1(s5[0],a[0],b[0]);
	xor xo2(s5[1],a[1],b[1]);
	xor xo3(s5[2],a[2],b[2]);
	xor xo4(s5[3],a[3],b[3]);

	xnor xn1(s6[0],a[0],b[0]);
	xnor xn2(s6[1],a[1],b[1]);
	xnor xn3(s6[2],a[2],b[2]);
	xnor xn4(s6[3],a[3],b[3]);

//not da chave
	not n1 (s2,key);

//portas and para controlar o grupo OR/NOR
	and a5(s7[0],s3[0],s2);
	and a6(s7[1],s3[1],s2);
	and a7(s7[2],s3[2],s2);
	and a8(s7[3],s3[3],s2);
	
	and a9(s8[0],s4[0],s2);
	and a10(s8[1],s4[1],s2);
	and a11(s8[2],s4[2],s2);
	and a12(s8[3],s4[3],s2);

//portas and para controlar o grupo XOR/XNOR	
	and a13(s9[0],s5[0],key);
	and a14(s9[1],s5[1],key);
	and a15(s9[2],s5[2],key);
	and a16(s9[3],s5[3],key);

	and a17(s10[0],s6[0],key);
	and a18(s10[1],s6[1],key);
	and a19(s10[2],s6[2],key);
	and a20(s10[3],s6[3],key);	

//portas xor para selecionar as saidas dos controladores and dos grupos
	xor x0(s0[0],s7[0],s9[0]);
	xor x1(s0[1],s7[1],s9[1]);
	xor x2(s0[2],s7[2],s9[2]);
	xor x3(s0[3],s7[3],s9[3]);

	xor x4(s1[0],s8[0],s10[0]);
	xor x5(s1[1],s8[1],s10[1]);
	xor x6(s1[2],s8[2],s10[2]);
	xor x7(s1[3],s8[3],s10[3]);
		
endmodule //f4

module testf4;

// ---- dados locais

reg [3:0]a;
reg [3:0]b;
reg key;
wire [3:0]s0;
wire [3:0]s1;

	f4_gate AUX(s0,s1,a,b,key);	

initial
	begin
	a = 4'b0000;	b = 4'b0000;	key = 1'b0;
	end
// ---- parte principal

initial
	begin
	
	//execucao unitaria
	$display ("Exemplo0024 - Tiago Moreira - 438948");
	$display ("Test LU's module\n");

	$display ("Chave = 0-OR/NOR; 1-XOR/XNOR");
	
	#1		$display ("Chave = %b\n%b | %b = %b\t~(%b | %b) = %b",key,a,b,s0,a,b,s1);
	#1		a = 4'b0011;	b = 4'b0101;
	#1		$display ("%b | %b = %b\t~(%b | %b) = %b",a,b,s0,a,b,s1);
	#1		a = 4'b1111;	b = 4'b1111;
	#1		$display ("%b | %b = %b\t~(%b | %b) = %b",a,b,s0,a,b,s1);
	#1		a = 4'b1111;	b = 4'b0000;
	#1		$display ("%b | %b = %b\t~(%b | %b) = %b",a,b,s0,a,b,s1);
	#1		a = 4'b0110;	b = 4'b1010;
	#1		$display ("%b | %b = %b\t~(%b | %b) = %b",a,b,s0,a,b,s1);
	
	#1		a = 4'b0000;	b = 4'b0000;	key = 1'b1;
	#1		$display ("Chave = %b\n%b ^ %b = %b\t~(%b ^ %b) = %b",key,a,b,s0,a,b,s1);
	#1		a = 4'b0011;	b = 4'b0101;
	#1		$display ("%b ^ %b = %b\t~(%b ^ %b) = %b",a,b,s0,a,b,s1);
	#1		a = 4'b1111;	b = 4'b1111;
	#1		$display ("%b ^ %b = %b\t~(%b ^ %b) = %b",a,b,s0,a,b,s1);
	#1		a = 4'b1111;	b = 4'b0000;
	#1		$display ("%b ^ %b = %b\t~(%b ^ %b) = %b",a,b,s0,a,b,s1);
	#1		a = 4'b0110;	b = 4'b1010;
	#1		$display ("%b ^ %b = %b\t~(%b ^ %b) = %b",a,b,s0,a,b,s1);
	
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

*/