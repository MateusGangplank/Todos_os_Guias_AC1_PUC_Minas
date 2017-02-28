//Exemplo0003
//Nome: Iago Braga
//Matricula: 427415


//--AND GATE
	module andgate (output s, input p, input q);
	assign s = p & q;
	end module

//--Teste de Buffer
	module testandgate;
	//-------Dados locais--------
	reg a, b;
	wire s;
	
	//------Instancia------------
	andgate AND1 (s,a,b);
	
	//------Preparação-----------
	initial begin:start
	a=0;
	b=0;
	end

	//------Parte Principal------
	initial begin:main
	$display("Exemplo0003");
	$display("Teste ANDGATE:");
	$display("\na & b = s\n");
        a=0; b=0;
	#1 $display("%b & %b = %b", a, b, s);
	a=0; b=1;
	#1 $display("%b & %b = %b", a, b, s);
	a=1; b=0;
	#1 $display("%b & %b = %b", a, b, s);
	a=1; b=1;
	#1 $display("%b & %b = %b", a, b, s);
	end
	
	endmodule