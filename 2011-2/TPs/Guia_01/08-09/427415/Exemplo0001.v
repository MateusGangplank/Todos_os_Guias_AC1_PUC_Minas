//Exemplo0001 - buffer
//Nome: Iago Braga
//Matricula: 427415


//--Buffer
	module buffer (output s, input p);
	assign s = p; 										//criar vinculo permanente (dependencia)
	end module   										//buffer
	
//--Teste de Buffer
	module testbuffer;
	//-------Dados locais--------
	reg a; 													//definir registrador (variavel independente)
	wire s;													//definir conexao (variavel dependente)
	
	//------Instancia------------
	buffer BF1 (s,a)									//buffer com saida em s, entrada em a
	
	//------Preparacao----------
	initial begin:start
	a=0;
	end
	
	//------Parte Principal-------
	initial begin:main									//execucao unitária
	$display("Exemplo0001");
	$display("Teste Buffer:");
	$display("\t    time\ta = s");					//execucao permanente
	$monitor("%d\t%b = %b", $time, a, s);	
	
	#1 a=1;												//apos uma unidade de tempo, mudar para 0 o valor do registrador
	#2 a=0;												//apos duas unidades de tempo, mudar para 1 o valor do registrador
	end
	
	endmodule