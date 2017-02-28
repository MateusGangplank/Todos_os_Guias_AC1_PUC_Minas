//Exemplo0005
//Nome: Gustavo Barbosa
//Matricula: 427410


//--XOR GATE
	module xorgate (output s [0:3], input p [0:3], input q [0:3]);
	assign s = p ^ q;
	end module

//Teste de Buffer
	module testnotgate;
	//-------Dados locais--------
	reg [0:3] a,b;
	wire [0:3] s;
	
	//------Instancia------------
	xorgate XOR1 (s,a,b);
	
	//------Preparação-----------
	initial begin:start
	a=4'b0011;
	b=4'b0101;
	end

	//------Parte Principal-------
	initial begin:main
	$display("Exemplo0005");
	$display("Teste XORGATE:");
	$display("\na   ^   b = s\n");
	$monitor("%b ^ %b = %b", a, b, s);
	  #1  a=0; b=0; // valores decimais
          #1  a=4'b0010; b=4'b0001;
          #1  a=4'd1;    b=3;
          #1  a=4'o5;    b=2;
          #1  a=4'hA;    b=3;
          #1  a=4'h9;    b=4'o3;
	end
	
	endmodule