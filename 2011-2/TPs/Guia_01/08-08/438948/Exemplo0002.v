// Exemplo0002 - NOT
// Nome: Tiago Moreira
// Matricula: 438948

// -- not gate

module notgate (output s, input p);
	assign s = ~p; //criar vinculo permanente (dependencia)
endmodule //notgate

// --test notgate

module testnotgate;

// ---- dados locais

reg a; //definir registrador (variavel independente)

wire s; //definir conexao (fio) - (variavel dependente)

// ---- instancia

notgate NOT1 (s,a);

// ---- preparacao

initial
	begin:start
	a = 0;
	end
	
// ---- parte principal

initial
	begin:main
	
	//execucao unitaria
	$display ("Exemplo0002 - Tiago Moreira - 438948");
	$display ("Test Not Gate");
	$display ("\n\t\t time\t~a = s");
	
	// apos uma unidade de tempo mudar o valor do registrador para 1
	#1	$display ("%d \t~%b = %b",$time,a,s);
	a = 1;
	
	// apos uma unidade de tempo exibir valor
	#1 $display ("%d \t~%b = %b",$time,a,s);
	
	end
endmodule //testnotgate

// -- Documentacao complementar
// 
// 		Historico
// Nome					Data				Modificacao
// Exemplo0001			05/08/2011		Esboco Buffer
// Exemplo0002			05/08/2011		Esboco Porta not ( not gate )
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