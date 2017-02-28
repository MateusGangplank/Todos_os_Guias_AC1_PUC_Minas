//Exemplo0009
//Nome: Iago Braga
//Matricula: 427415


//--AND GATE
	module andgate (output s, input p, input q, input r);
	assign s = p & q & r;
	end module

//--Test Buffer
	module testandgate;
	//-------Dados locais--------
	reg a, b, c;
	wire s;
	
	//------Instancia------------
	andgate AND1 (s,a,b,c);
	
	//------Preparação-----------
	initial begin:start
	a=0;
	b=0;
	c=0;
	end

	//------Parte Principal------
	initial begin:main
	$display("Exemplo0009");
	$display("Teste ANDGATE:");
	$display("\na & b & c = s\n");
        $monitor("&b & %b & %b = %b",a,b,c,s);
        #1 c=1;
        #1 b=1; c=0;
        #1 c=1;
        #1 a=1; b=0; c=0;
        #1 c=1;
        #1 b=1; c=0;
        #1 c=1;
	end
	
	endmodule