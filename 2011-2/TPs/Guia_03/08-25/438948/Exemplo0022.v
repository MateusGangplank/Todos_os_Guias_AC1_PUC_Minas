// Exemplo0022 - F4
// Nome: Tiago Moreira
// Matricula: 438948

// -- f4_gate

module f4_gate(output [3:0]s,input [3:0]a, input [3:0]b, input key);

//saidas intermediarias
wire [3:0]s0;
wire [3:0]s1;
wire s2;
wire [3:0]s3;
wire [3:0]s4;

//bit a bit
	or o1(s0[0],a[0],b[0]);
	or o2(s0[1],a[1],b[1]);
	or o3(s0[2],a[2],b[2]);
	or o4(s0[3],a[3],b[3]);

	and a1(s1[0],a[0],b[0]);
	and a2(s1[1],a[1],b[1]);
	and a3(s1[2],a[2],b[2]);
	and a4(s1[3],a[3],b[3]);
	
	not n1 (s2,key);
	
	and a5(s3[0],s0[0],s2);
	and a6(s3[1],s0[1],s2);
	and a7(s3[2],s0[2],s2);
	and a8(s3[3],s0[3],s2);
	
	and a9(s4[0],s1[0],key);
	and a10(s4[1],s1[1],key);
	and a11(s4[2],s1[2],key);
	and a12(s4[3],s1[3],key);
	
	xor x0(s[0],s3[0],s4[0]);
	xor x1(s[1],s3[1],s4[1]);
	xor x2(s[2],s3[2],s4[2]);
	xor x3(s[3],s3[3],s4[3]);
	
endmodule //f4

module testf4;

// ---- dados locais

reg [3:0]a;
reg [3:0]b;
reg key;
wire [3:0]s;

	f4_gate AUX(s,a,b,key);	

initial
	begin
	a = 4'b0000;	b = 4'b0000;	key = 1'b0;
	end
// ---- parte principal

initial
	begin
	
	//execucao unitaria
	$display ("Exemplo0022 - Tiago Moreira - 438948");
	$display ("Test LU's module\n");

	$display ("Chave = 0-OR/1-AND");
	
	#1		$display ("Chave = %b\n%b | %b = %b",key,a,b,s);
	#1		a = 4'b0011;	b = 4'b0101;
	#1		$display ("%b | %b = %b",a,b,s);
	#1		a = 4'b1111;	b = 4'b1111;
	#1		$display ("%b | %b = %b",a,b,s);
	#1		a = 4'b1111;	b = 4'b0000;
	#1		$display ("%b | %b = %b",a,b,s);
	#1		a = 4'b0110;	b = 4'b1010;
	#1		$display ("%b | %b = %b",a,b,s);
	
	#1		a = 4'b0000;	b = 4'b0000;	key = 1'b1;
	#1		$display ("Chave = %b\n%b & %b = %b",key,a,b,s);
	#1		a = 4'b0011;	b = 4'b0101;
	#1		$display ("%b & %b = %b",a,b,s);
	#1		a = 4'b1111;	b = 4'b1111;
	#1		$display ("%b & %b = %b",a,b,s);
	#1		a = 4'b1111;	b = 4'b0000;
	#1		$display ("%b & %b = %b",a,b,s);
	#1		a = 4'b0110;	b = 4'b1010;
	#1		$display ("%b & %b = %b",a,b,s);
	
	end
endmodule //testf4

// -- Documentacao complementar
 
/*
 		Historico
 Nome						Data				Modificacao
 Exemplo0021			23/08/2011		Esboco Modulo com Descricao de circuito usando portas nativas(AND,OR)
 Exemplo0022			23/08/2011		Esboco Modulo com Descricao de circuito usando portas nativas(AND,OR),selecionavel
 
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

*/