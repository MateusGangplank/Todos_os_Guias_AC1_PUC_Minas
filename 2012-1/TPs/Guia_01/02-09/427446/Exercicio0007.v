//--------------------------------------
//Exercicio0007 - XNOR
//Nome: Mateus Guilherme do Carmo Cruz
//Matrícula: 427446
//---------------------------------------

//------------------
//-- xnor gate
//------------------

module xnorgate(output s,
						input p,
						input q);
	assign s = p&q | (~p)&(~q);
endmodule//xnorgate

//--------------------
//-- test xnor gate
//--------------------

module testxnorgate;
	//------------ definir dados
	reg a,b;	//definir registradores
	wire s;	//conexão(fio)
	
	//------------------- instancia
	xnorgate XNOR1(s,a,b);
	
	//-------------------preparacao
	initial begin:start
		a=0;b=0;
	end
	
	//-------------------parte principal
	initial begin
		$display("Exercicio0007 - Mateus Guilherme do Carmo Cruz - 427446");
		$display("Test XNOR gate");
		$display("\na ~^ b = s\n");
		$monitor("%b ~^ %b = %b",a,b,s);
		#1 a=0;b=1;
		#1 a=1;b=0;
		#1 a=1;b=1;
	end

endmodule//testxnorgate
