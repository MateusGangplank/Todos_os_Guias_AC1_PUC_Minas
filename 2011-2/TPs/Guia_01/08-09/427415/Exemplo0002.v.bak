//Exemplo0002
//Nome: Eduardo Botelho
//Matricula: 427395


//--NOT GATE
	module notgate (output s, input p);
	assign s = ~p;
	end module

//--Teste de Buffer
	module testnotgate;
	//-------Dados locais--------
	reg a;
	wire s;
	
	//------Instancia------------
	notgate NG1 (s,a);

	//------Parte Principal-------
	initial begin:main
	$display("Exemplo0002");
	$display("Teste NOTGATE:");
	$display("\n~a = s\n");

	a=0;
	#1 $display("~%b = %b", a, s);
	a=1;
	#1 $display("~%b = %b", a, s);
	end
	
	endmodule