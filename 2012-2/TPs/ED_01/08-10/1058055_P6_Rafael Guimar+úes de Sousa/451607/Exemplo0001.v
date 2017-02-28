//--------------------------------------
//Exemplo0001 - buffer
//Nome: Rafael Guimaraes de Sousa
//Matrícula: 451607
//---------------------------------------

//------------------
//-- buffer
//------------------

module buffer(output s, input p);
	assign s = p; //criar vínculo permanente
						//(dependência)
endmodule //buffer

//----------------
//-- test buffer
//----------------

module testbuffer;
//------------- dados locais
	reg a; //definir registrador
				//(variável independente)
	wire s; //definir conexão(fio)
				//(variável dependente)

//------------------- instancia
	buffer BF1(s,a);
//-------------------- preparação
	initial begin:start
		a=0; //valor inicial
	end
//--------------------- parte principal
	initial begin:main
			//execução unitária
		$display("Exemplo0001 - Rafael Guimaraes de Sousa - 451607");
		$display("Test buffer");
		$display("\t	time\ta = s");
			 //execução permanente
		$monitor("%d\t%b = %b", $time,a,s);
			//apos uma unidade de tempo
			//mudar o valor do registrador para 0
		#1 a=1;
			//após duas unidades de tempo
			//mudar o valor do registrador para 1
		#2 a=0;
	end

endmodule //testbuffer