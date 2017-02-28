//--------------------------------------
//Exemplo0001 - buffer
//Nome: Guilherme Diniz de Assumpcao
//Matr�cula: 462269
//---------------------------------------

//------------------
//-- buffer
//------------------

module buffer(output s, input p);
	assign s = p; //criar v�nculo permanente
						//(depend�ncia)
endmodule //buffer

//----------------
//-- test buffer
//----------------

module testbuffer;
//------------- dados locais
	reg a; //definir registrador
				//(vari�vel independente)
	wire s; //definir conex�o(fio)
				//(vari�vel dependente)

//------------------- instancia
	buffer BF1(s,a);
//-------------------- prepara��o
	initial begin:start
		a=0; //valor inicial
	end
//--------------------- parte principal
	initial begin:main
			//execu��o unit�ria
		$display("Exemplo0001 - Guilherme Diniz de Assumpcao  - 462269");
		$display("Test buffer");
		$display("\t	time\ta = s");
			 //execu��o permanente
		$monitor("%d\t%b = %b", $time,a,s);
			//apos uma unidade de tempo
			//mudar o valor do registrador para 0
		#1 a=1;
			//ap�s duas unidades de tempo
			//mudar o valor do registrador para 1
		#2 a=0;
	end

endmodule //testbuffer