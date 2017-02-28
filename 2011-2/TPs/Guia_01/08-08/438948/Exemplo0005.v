// Exemplo0005 - XOR
// Nome: Tiago Moreira
// Matricula: 438948

// -- xor gate

module xorgate (output [0:3]s, input [0:3]p, input [0:3]q);
	assign s = p^q; //criar vinculo permanente (dependencia)
endmodule //xorgate

// --test xorgate

module testxorgate;

// ---- dados locais

reg [0:3]a,b; //definir registradores (variavel independente)

wire [0:3]s; //definir conexao (fio) - (variavel dependente)

// ---- instancia

xorgate XOR1 (s,a,b);

// ---- preparacao

initial
	begin:start
	a = 4'b0011; //4 valores binarios
	b = 4'b0101;
	end
	
// ---- parte principal

initial
	begin:main
	
	//execucao unitaria
	$display ("Exemplo0005 - Tiago Moreira - 438948");
	$display ("Test Xor Gate");
	$display ("\n\t\t time\ta ^ b = s");
	$monitor ("%d\t%b ^ %b = %b",$time,a,b,s);
	
	#1	a = 0;	b = 0;	//	valores decimais
	#1	a=4'b0010;	b=4'b0001;	//	valores binarios
	#1 a=4'd1;	b = 3;	// decimal e decimal
	#1 a=4'o5;	b = 2;	//	octal e decimal
	#1 a=4'hA;	b = 3;	//	hexadecimal e decimal
	#1 a=4'h9;	b=4'o3;	//	hexadecimal e octal
	
	end
endmodule //testxorgate

// -- Documentacao complementar
// 
// 		Historico
// Nome					Data				Modificacao
// Exemplo0001			05/08/2011		Esboco Buffer
// Exemplo0002			05/08/2011		Esboco Porta not ( not gate )
// Exemplo0003			05/08/2011		Esboco Porta and ( and gate )
// Exemplo0004			05/08/2011		Esboco Porta or ( or gate )
// Exemplo0005			05/08/2011		Esboco Porta xor ( xor gate )
//
//			Testes e Resultados
//
// Exemplo0001
//			time		a = s
//			0			0 = 0
//			1			1 = 1
//			2			0 = 0
//
//	Exemplo0002
//			time	~a = s
//			 1		~0 = 1
//			 2		~1 = 0
//
//	Exemplo0003
//			time	a&b = s
//			 1		0&0 = 0
//			 2		0&1 = 0
//			 3		1&0 = 0
//			 4		1&1 = 1
//
//	Exemplo0004
//			time	a|b = s
//			 1		0|0 = 0
//			 2		0|1 = 1
//			 3		1|0 = 1
//			 4		1|1 = 1
//
//	Exemplo0005
//			time	  a  ^	b  =  s
//			 0		0011 ^ 0101 = 0110
//        1		0000 ^ 0000 = 0000
//			 2		0010 ^ 0001 = 0011
//			 3		0001 ^ 0011 = 0010
//			 4		0101 ^ 0010 = 0111
//			 5		1010 ^ 0011 = 1001
//			 6		1001 ^ 0011 = 1010
//