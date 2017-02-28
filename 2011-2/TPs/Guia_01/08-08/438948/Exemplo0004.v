// Exemplo0004 - OR
// Nome: Tiago Moreira
// Matricula: 438948

// -- or gate

module orgate (output s, input p, input q);
	assign s = p|q; //criar vinculo permanente (dependencia)
endmodule //orgate

// --test orgate

module testorgate;

// ---- dados locais

reg a,b; //definir registradores (variavel independente)

wire s; //definir conexao (fio) - (variavel dependente)

// ---- instancia

orgate OR1 (s,a,b);

// ---- preparacao

initial
	begin:start
	a = 0; b = 0;
	end
	
// ---- parte principal

initial
	begin:main
	
	//execucao unitaria
	$display ("Exemplo0004 - Tiago Moreira - 438948");
	$display ("Test Or Gate");
	$display ("\n\t\t time\ta|b = s");
	
	// apos uma unidade de tempo mudar o valor do registrador
	#1	$display ("%d \t%b|%b = %b",$time,a,b,s);
	a = 0;	b = 1;
	
	// apos uma unidade de tempo mudar o valor do registrador
	#1	$display ("%d \t%b|%b = %b",$time,a,b,s);
	a = 1;	b = 0;
	
	// apos uma unidade de tempo mudar o valor do registrador
	#1	$display ("%d \t%b|%b = %b",$time,a,b,s);
	a = 1;	b = 1;
	
	// apos uma unidade de tempo exibir os valores dos registradores e da saida
	#1	$display ("%d \t%b|%b = %b",$time,a,b,s);
	
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