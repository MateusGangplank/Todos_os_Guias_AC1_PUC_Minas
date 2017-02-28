//--------------------------------------
//Exercicio0008 - AND com 3 entradas - 2 versão
//Nome: Mateus Guilherme do Carmo Cruz
//Matrícula: 427446
//---------------------------------------

//------------------
//-- simple and gate
//------------------

module simpleandgate(output s, input p, input q);
	assign s = p&q;
endmodule //simpleandgate

//------------------
//-- and gate
//------------------

module andgate(output s,input p,input q, input r);
	wire aux;
	simpleandgate AND1(aux,p,q);
	assign s = aux & r;
endmodule//andgate

//--------------------
//-- test and gate
//--------------------

module testandgate;
	//------------ definir dados
	reg a,b,c;	//definir registradores
	wire s;	//conexão(fio)
	
	//------------------- instancia
	andgate AND2(s,a,b,c);
	
	//-------------------preparacao
	initial begin:start
		a=0;b=0;c=0;
	end
	
	//-------------------parte principal
	initial begin
		$display("Exercicio0008 - Mateus Guilherme do Carmo Cruz - 427446");
		$display("Test AND gate com 3 entradas (versão 2)");
		$display("\na & b & c = s\n");
		$monitor("%b & %b & %b = %b",a,b,c,s);
		#1 a=0;b=0;c=1;
		#1 a=0;b=1;c=0;
		#1 a=1;b=0;c=0;
		#1 a=1;b=1;c=0;
		#1 a=1;b=0;c=1;
		#1 a=0;b=1;c=1;
		#1 a=1;b=1;c=1;
	end

endmodule//testandgate
