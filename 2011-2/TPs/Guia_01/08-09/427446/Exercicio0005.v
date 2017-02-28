//----------------------------------------
// Exerc�cio0005 - porta OR com 3 entradas
//	Nome: Mateus Guilherme do Carmo Cruz
// Matr�cula: 427446
//----------------------------------------

// or gate

module orgate(output s, input a, input b, input c);
	assign s = a|(b|c);
endmodule

//run or gate

module runorgate;
	reg a,b,c; //registradores
	wire s; //conex�o
	
	//instancia
	orgate OR1(s,a,b,c);
	
	//--prepara��o
	initial begin:start
		a=0;b=0;c=0;
	end
	
	//--parte principal
	initial begin:main
		$display("Exerc�cio0005 - Mateus Guilherme do Carmo Cruz - 427446");
		$display("Porta OR com tr�s entradas.");
		$display("\t	time\ta|(b|c) = s");
		a=0;b=0;c=0;
		$monitor("%d\t%b|(%b|%b) = %b", $time,a,b,c,s);
	#1 a=0;b=0;c=1;
	#1 a=0;b=1;c=0;
	#1 a=0;b=1;c=1;
	#1	a=1;b=0;c=0;
	#1	a=1;b=0;c=1;
	#1 a=1;b=1;c=0;
	#1 a=1;b=1;c=1;
	end
endmodule//or gate