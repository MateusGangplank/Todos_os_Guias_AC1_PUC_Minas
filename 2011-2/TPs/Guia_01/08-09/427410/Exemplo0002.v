//Exemplo0002
//Nome: Gustavo Barbosa
//Matricula: 427410


//--NOT GATE
	module notgate (output s, input p);
	assign s = ~p;
	end module

          // testes buffer
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
	#1 $display("~%b=%b",a,s);
	a=1;
	#1 $display("~%b=%b",a,s);
	end
	
	endmodule