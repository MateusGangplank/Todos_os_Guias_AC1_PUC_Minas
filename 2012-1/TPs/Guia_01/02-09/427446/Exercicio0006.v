//--------------------------------------
//Exercicio0006 - XOR
//Nome: Mateus Guilherme do Carmo Cruz
//Matrícula: 427446
//---------------------------------------

//------------------
//-- xor gate
//------------------

module xorgate(output s,
						input p,
						input q);
	assign s = (~p)&q | p&(~q);
endmodule//xorgate

//--------------------
//-- test xor gate
//--------------------

module testxorgate;
	//------------ definir dados
	reg a,b;	//definir registradores
	wire s;	//conexão(fio)
	
	//------------------- instancia
	xorgate XOR1(s,a,b);
	
	//-------------------preparacao
	initial begin:start
		a=0;b=0;
	end
	
	//-------------------parte principal
	initial begin
		$display("Exercicio0006 - Mateus Guilherme do Carmo Cruz - 427446");
		$display("Test XOR gate");
		$display("\na ~| b = s\n");
		$monitor("%b ~| %b = %b",a,b,s);
		#1 a=0;b=1;
		#1 a=1;b=0;
		#1 a=1;b=1;
	end

endmodule//testxorgate
