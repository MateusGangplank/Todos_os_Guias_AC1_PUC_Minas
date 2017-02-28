// Exemplo0001 - buffer
// Nome: Tiago Moreira
// Matricula: 438948

// -- Buffer

module buffer (output s, input p);
	assign s = p; //criar vinculo permanente (dependencia)
endmodule //buffer

// --testBuffer

module testbuffer;

// ---- dados locais

reg a; //definir registrador (variavel independente)

wire s; //definir conexao (fio) - (variavel dependente)

// ---- instancia

buffer Bf1 (s,a);

// ---- preparacao

initial
	begin:start
	a = 0;
	end
	
// ---- parte principal

initial
	begin:main
	
	//execucao unitaria
	$display ("Exemplo0001 - Tiago Moreira - 438948");
	$display ("Test Buffer\n");
	$display ("\t\t time\ta = s");
	
	//execucao permanente
	$monitor ("%d\t%b = %b",$time,a,s);
	
	// apos uma unidade de tempo mudar o valor do registrador para 1
	#1	a = 1;
	
	// apos duas unidades de tempo mudar o valor do registrador para 0
	#2 a = 0;
	
	end
endmodule //testBuffer

// -- Documentacao complementar
// 
// 		Historico
// Nome					Data				Modificacao
// Exemplo0001			05/08/2011		Esboco Buffer
//
//			Testes e Resultados
//
// Exemplo0001
//			time		a = s
//			0			0 = 0
//			1			1 = 1
//			3			0 = 0