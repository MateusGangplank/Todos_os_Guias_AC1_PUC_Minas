//Exemplo0004
//Nome: Iago Braga
//Matricula: 427415


//--OR GATE
	module orgate (output s, input p, input q);
	assign s = p | q;
	end module

//--Teste de Buffer
	module testorgate;
	//-------Dados locais--------
	reg a, b;
	wire s;
	
	//------Instancia------------
	orgate OR1 (s,a,b);
	
	//------Preparação-----------
	initial begin:start
	a=0;
	b=0;
	end

	//------Parte Principal------
	initial begin:main
	$display("Exemplo0004");
	$display("Teste ORGATE:");
	$display("\na | b = s\n");
        a=0; b=0;
	#1 $display("%b | %b = %b", a, b, s);
	a=0; b=1;
	#1 $display("%b | %b = %b", a, b, s);
	a=1; b=0;
	#1 $display("%b | %b = %b", a, b, s);
	a=1; b=1;
	#1 $display("%b | %b = %b", a, b, s);
	end
	
	endmodule