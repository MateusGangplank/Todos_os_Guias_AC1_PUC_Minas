//--------------------------------------
//Exemplo0002 - NOT
//Nome: Guilherme Diniz de Assumpcao
//Matrícula: 462269
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
				//(variável independente)
	wire s; //definir conexão(fio)
				//(variável dependente)

//------------------- instancia
	notgate NOT1(s,a);
//-------------------- preparação
	initial begin:start
		a=0; //valor inicial
	end
//--------------------- parte principal
	initial begin
		$display("Exemplo0002 - Guilherme Diniz de Assumpcao  - 462269");
		$display("Test NOT gate");
		$display("\n~a = s\n");
		a=0;
		#1	$display("~%b = %b",s,a);
			a=1;
		#1 $display("~%b = %b",s,a);
	end

endmodule //testnotgate