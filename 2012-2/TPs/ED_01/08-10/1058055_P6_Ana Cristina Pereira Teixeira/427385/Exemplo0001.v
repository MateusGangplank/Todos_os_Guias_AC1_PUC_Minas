// PUC Minas - Ciencia da Computacao - Arquitetura de Computadores I
// Exemplo0001 - buffer 
// Nome: Ana Cristina P. Teixeira 
// Matricula: 427385

// -------------------------
// -- buffer 
// -------------------------
module buffer (output s, input p); 
	assign s = p; // criar vinculo permanente 
	// (dependencia) 
endmodule // buffer

// ------------------------- 
// -- test buffer 
// ------------------------- 
module testbuffer; 
// ------------------------- dados locais 
	reg a; // definir registrador 
	// (variavel independente) 
	wire s; // definir conexao (fio) 
	// (variavel dependente ) 
// ------------------------- instancia 
	buffer BF1 (s, a); 
// ------------------------- preparacao 
	initial begin:start 
		a = 0; // valor inicial 
	end

// ------------------------- parte principal 
	initial begin:main 
	
	// execucao unitaria 
		$display("Exemplo 0001 - Ana Cristina - 427385"); 
		$display("Test buffer:"); 
		$display("\t \t time\ta = s"); 
	
	// execucao permanente 
		$monitor("%d\t%b = %b", $time, a, s); 
		// apos uma unidade de tempo 
		// mudar valor do registrador para 1 
		#1 a = 1; 
		// apos duas unidades de tempo 
		// mudar valor do registrador para 0 
		#2 a = 0; 
	end 
endmodule // testbuffer

// Previsao de testes
// time initial = 0, input/registrador a initial = 0, logo output s initial = 0
// time 1, input = 1, output = 1
// time 3 (#2), input = 0, output = 0