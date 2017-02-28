//--------------------------------------
//Exemplo0002 - NOT
//Nome: Mateus Guilherme do Carmo Cruz
//Matr�cula: 427446
//---------------------------------------

//------------------
//-- not gate
//------------------

module notgate(output s, input p);
	assign s = ~p;
endmodule //notgate

//----------------
//-- test not gate
//----------------

module testnotgate;
//------------- dados locais
	reg a; //definir registrador
				//(vari�vel independente)
	wire s; //definir conex�o(fio)
				//(vari�vel dependente)

//------------------- instancia
	notgate NOT1(s,a);
//-------------------- prepara��o
	initial begin:start
		a=0; //valor inicial
	end
//--------------------- parte principal
	initial begin
		$display("Exemplo0002 - Mateus Guilherme do Carmo Cruz - 427446");
		$display("Test NOT gate");
		$display("\n~a = s\n");
		a=0;
		#1	$display("~%b = %b",s,a);
			a=1;
		#1 $display("~%b = %b",s,a);
	end

endmodule //testnotgate