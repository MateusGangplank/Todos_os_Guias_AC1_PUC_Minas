//--------------------------------------
//Exercicio0008 - OR com 3 entradas
//Nome: Mateus Guilherme do Carmo Cruz
//Matrícula: 427446
//---------------------------------------

//------------------
//-- simple or gate
//------------------

module simpleorgate(output s, input p, input q);
	assign s = p|q;
endmodule //simpleorgate

//------------------
//-- or gate
//------------------

module orgate(output s,input p,input q, input r);
	wire aux;
	simpleorgate OR1(aux,p,q);
	assign s = aux | r;
endmodule //orgate

//--------------------
//-- test or gate
//--------------------

module testorgate;
	//------------ definir dados
	reg a,b,c;	//definir registradores
	wire s;	//conexão(fio)
	
	//------------------- instancia
	orgate OR2(s,a,b,c);
	
	//-------------------preparacao
	initial begin:start
		a=0;b=0;c=0;
	end
	
	//-------------------parte principal
	initial begin
		$display("Exercicio0008 - Mateus Guilherme do Carmo Cruz - 427446");
		$display("Test OR gate com 3 entradas");
		$display("\na | b | c = s\n");
		$monitor("%b | %b | %b = %b",a,b,c,s);
		#1 a=0;b=0;c=1;
		#1 a=0;b=1;c=0;
		#1 a=1;b=0;c=0;
		#1 a=1;b=1;c=0;
		#1 a=1;b=0;c=1;
		#1 a=0;b=1;c=1;
		#1 a=1;b=1;c=1;
	end

endmodule//testandgate
