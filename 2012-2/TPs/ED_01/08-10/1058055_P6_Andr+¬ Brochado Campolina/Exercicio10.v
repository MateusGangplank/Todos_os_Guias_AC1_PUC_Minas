//----
//Exercicio10
//Andre Campolina
//381217
//----

//--
//Modulo OR 2 entradas
//--

module orgate (output s, input p, input q);
	assign s = p|q;
endmodule

//--
//Modulo OR 4 entradas
//--

module orentradas (output s, input [0:3] p);
	wire a, b;
	orgate OR1(a,p[0],p[1]);
	orgate OR2(b,p[2],p[3]);
	orgate OR3(s,a,b);
endmodule

//--
//teste
//--

module testaor;
	reg [0:3] p;
	wire s;
	
	orentradas OR4(s, p);
	
	initial begin:start
		p=0;
	end
	
	initial begin
		$display("Exercicio10 - Andre Campolina - 381217");
		$display("Tabela Verdade porta OR 4 entradas");
		$display("\na b c d\ts\n");
		$monitor("%b \t%b",p,s);
		#1 p=1;
		#1 p=2;
		#1 p=3;
		#1 p=4;
		#1 p=5;
		#1 p=6;
		#1 p=7;
		#1 p=8;
		#1 p=9;
		#1 p=10;
		#1 p=11;
		#1 p=12;
		#1 p=13;
		#1 p=14;
		#1 p=15;
	end
endmodule