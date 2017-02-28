// ----------------------------------------
// Exemplo0001 - buffer
// Nome: João Henrique Mendes de Oliveira
// Matricula: 392734
// ----------------------------------------

// -------------------------
// -- buffer
// -------------------------

module buffer(output s, input p);
	assign s = p; //-- vinculo
endmodule //-- end module buffer

// -------------------------
// -- test buffer
// -------------------------

module testbuffer;
//-- dados locais
	reg a; //-- reg = registrador = entrada
	wire s; //-- wire = saída
	
//-- instanciando o "module buffer"
	buffer BF1(s, a);
	
//-- preparação
	initial begin:start
		a = 0; //-- valor inicial
	end //-- end start

//-- parte principal
	initial begin:main
	//-- execução 1 à 1
		$display("Exemplo0001 - João Henrique - 392734");
		$display("Test Buffer");
		$display("\t	time\ta = s"); //-- \t = 
	//-- execução sequencial
		$monitor("%d\t%b = %b", $time, a, s); //-- buscar explicação sobre essa linha
		
		#1 a = 1; //-- após uma unidade de tempo,
					 //-- mudar o valor do reg para 0.
		
		#2 a = 0; //-- após duas unidades de tempo,
					 //-- mudar o valor do reg para 1.
	end //-- end main

endmodule //-- end testbuffer