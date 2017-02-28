// Exemplo0010 - OR
// Nome: Tiago Moreira
// Matricula: 438948

// -- or gate (3 inputs)

module orgate (output s, input p, input q, input r);
	assign s = ~( (~p)&(~q)&(~r) ); //criar vinculo permanente (dependencia)
endmodule //orgate

// --test orgate

module testorgate;

// ---- dados locais

reg a,b,c; //definir registradores (variavel independente)

wire s; //definir conexao (fio) - (variavel dependente)

// ---- instancia

orgate OR2 (s,a,b,c);

// ---- preparacao

initial
	begin:start
	a = 0; b = 0; c = 0;
	end
	
// ---- parte principal

initial
	begin:main
	
	//execucao unitaria
	$display ("Exemplo0010 - Tiago Moreira - 438948");
	$display ("Test Or Gate - 3 inputs");
	$display ("\n\t\t time\ta|b|c = s");
	
	$monitor ("%d \t%b|%b|%b = %b",$time,a,b,c,s);
	
	// apos uma unidade de tempo mudar o valor do registrador
	#1	a = 0;	b = 0;	c = 1;
	#1	a = 0;	b = 1;	c = 0;
	#1	a = 0;	b = 1;	c = 1;
	#1	a = 1;	b = 0;	c = 0;
	#1	a = 1;	b = 0;	c = 1;
	#1	a = 1;	b = 1;	c = 0;
	#1	a = 1;	b = 1;	c = 1;
	
	end
endmodule //testorgate

// -- Documentacao complementar
// 
// 		Historico
// Nome					Data				Modificacao
// Exemplo0001			05/08/2011		Esboco Buffer
// Exemplo0002			05/08/2011		Esboco Porta not ( not gate )
// Exemplo0003			05/08/2011		Esboco Porta and ( and gate )
// Exemplo0004			05/08/2011		Esboco Porta or ( or gate )
// Exemplo0005			05/08/2011		Esboco Porta xor ( xor gate )
// Exemplo0006			05/08/2011		Esboco Porta nand ( nand gate )
// Exemplo0007			05/08/2011		Esboco Porta nor ( nor gate )
// Exemplo0008			05/08/2011		Esboco Porta xnor ( xnor gate )
// Exemplo0009			05/08/2011		Esboco Porta and ( and gate ) - 3 inputs
// Exemplo0010			05/08/2011		Esboco Porta or ( or gate ) - 3 inputs
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
//	Exemplo0006
//			time	~(a&b) = s
//			 1		~(0&0) = 1
//			 2		~(0&1) = 1
//			 3		~(1&0) = 1
//			 4		~(1&1) = 0
//
//	Exemplo0007
//			time	~(a|b) = s
//			 0		~(0|0) = 1
//			 1		~(0|1) = 0
//			 2		~(1|0) = 0
//			 3		~(1|1) = 0
//
//	Exemplo0008
//			time	~(a^b) = s
//			 0		~(0^0) = 1
//			 1		~(0^1) = 0
//			 2		~(1^0) = 0
//			 3		~(1^1) = 1
//
//	Exemplo0009
//			time	a&b&c = s
//			 0		0&0&0 = 0
//			 1		0&0&1 = 0
//			 2		0&1&0 = 0
//			 3		0&1&1 = 0
//			 4		1&0&0 = 0
//			 5		1&0&1 = 0
//			 6		1&1&0 = 0
//			 7		1&1&1 = 1
//
//	Exemplo0010
//			time	a|b|c = s
//			 0		0|0|0 = 0
//			 1		0|0|1 = 1
//			 2		0|1|0 = 1
//			 3		0|1|1 = 1
//			 4		1|0|0 = 1
//			 5		1|0|1 = 1
//			 6		1|1|0 = 1
//			 7		1|1|1 = 1