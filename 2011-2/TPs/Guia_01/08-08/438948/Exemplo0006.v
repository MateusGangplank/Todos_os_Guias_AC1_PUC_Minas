// Exemplo0006 - NAND
// Nome: Tiago Moreira
// Matricula: 438948

// -- nand gate

module nandgate (output s, input p, input q);
	assign s = ~(p&q); //criar vinculo permanente (dependencia)
endmodule //nandgate

// --test nandgate

module testnandgate;

// ---- dados locais

reg a,b; //definir registradores (variavel independente)

wire s; //definir conexao (fio) - (variavel dependente)

// ---- instancia

nandgate NAND1 (s,a,b);

// ---- preparacao

initial
	begin:start
	a = 0; b = 0;
	end
	
// ---- parte principal

initial
	begin:main
	
	//execucao unitaria
	$display ("Exemplo0006 - Tiago Moreira - 438948");
	$display ("Test Nand Gate");
	$display ("\n\t\t time\t~(a&b) = s");
	
	// apos uma unidade de tempo mudar o valor do registrador
	#1	$display ("%d \t~(%b&%b) = %b",$time,a,b,s);
	a = 0;	b = 1;
	
	// apos uma unidade de tempo mudar o valor do registrador
	#1	$display ("%d \t~(%b&%b) = %b",$time,a,b,s);
	a = 1;	b = 0;
	
	// apos uma unidade de tempo mudar o valor do registrador
	#1	$display ("%d \t~(%b&%b) = %b",$time,a,b,s);
	a = 1;	b = 1;
	
	// apos uma unidade de tempo exibir os valores dos registradores e da saida
	#1	$display ("%d \t~(%b&%b) = %b",$time,a,b,s);
	
	end
endmodule //testnandgate

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