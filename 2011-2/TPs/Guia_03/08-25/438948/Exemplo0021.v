// Exemplo0021 - F4
// Nome: Tiago Moreira
// Matricula: 438948

// -- f4_gate

module f4_gate(output [3:0]s1, output [3:0]s0,input [3:0]a, input [3:0]b);
//bit a bit
	and a1(s1[0],a[0],b[0]);
	and a2(s1[1],a[1],b[1]);
	and a3(s1[2],a[2],b[2]);
	and a4(s1[3],a[3],b[3]);
	
	or o1(s0[0],a[0],b[0]);
	or o2(s0[1],a[1],b[1]);
	or o3(s0[2],a[2],b[2]);
	or o4(s0[3],a[3],b[3]);
	
endmodule //f4

module testf4;

// ---- dados locais

reg [3:0]a;
reg [3:0]b;
wire [3:0]s0;
wire [3:0]s1;

	f4_gate AUX(s1,s0,a,b);	

initial
	begin
	a = 4'b0000;	b = 4'b0000;
	end
// ---- parte principal

initial
	begin
	
	//execucao unitaria
	$display ("Exemplo0021 - Tiago Moreira - 438948");
	$display ("Test LU's module\n");

	$display ("\t\t Tempo\t a  |  b  =  s0\t\t\t a   &   b  =  s1");
	$monitor ("%d\t%b|%b = %b\t\t%b & %b = %b",$time,a,b,s0,a,b,s1);
	#1		a = 4'b0011;	b = 4'b0101;
	#1		a = 4'b1111;	b = 4'b1111;
	#1		a = 4'b1111;	b = 4'b0000;
	#1		a = 4'b0110;	b = 4'b1010;
	
	end
endmodule //testf4

// -- Documentacao complementar
 
/*
 		Historico
 Nome						Data				Modificacao
 Exemplo0021			23/08/2011		Esboco Modulo com Descricao de circuito usando portas nativas(AND,OR)

			Testes e Resultados

 Exemplo0021
 	Resultados esperados
	a			b			a&b		a|b
	0000		0000		0000		0000	ok
	0011		0101		0001		0111	ok
	1111		1111		1111		1111	ok
	1111		0000		0000		1111	ok
	0110		1010		0010		1110	ok
*/