// Exemplo0001 - buffer
// Nome: Luiz Henrique da Costa Silva
// Matricula: 449800

// -- buffer

module buffer (output s, input p);
	assign s = p;		// criar vinculo permanente (dependencia)

endmodule			// buffer


// -- test buffer

module testbuffer;
					//dados locais

	reg a;		//definir registrador (variavel independente)
	
	wire s;		//definir conexao (fio) (variavel dependente)

					//instancia
	buffer BF1 (s, a);
					//preparacao
	initial begin:start
		a=0;	//valor inicial
	end
					//parte principal
					
	initial begin:main
			// execucao unitaria
		$display("Exemplo 0001 - Luiz Henrique da Costa Silva - 449800");
		$display("Test buffer:");
		$display("\t	time\ta = s");
			// execucao permanente
		$monitor("%d\t%b = %b", $time, a, s);
			// apos uma unidade de tempo mudar valor do registrador para 0
	#1 a=1;
			// apos duas unidades de tempo mudar valor do registrador para 1
	#2 a=0;
	end
endmodule			//test buffer