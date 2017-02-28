//--------------------------------------
//Exercicio0001 - NAND
//Nome: Mateus Guilherme do Carmo Cruz
//Matr�cula: 427446
//---------------------------------------

//------------------
//-- NAND gate
//------------------

module nandgate(output s,
						input p,
						input q);
	assign s = ~(p&q);
endmodule//nandgate

//--------------------
//-- test nand gate
//--------------------

module testnandgate;
	//------------ definir dados
	reg a,b;	//definir registradores
	wire s;	//conex�o(fio)
	
	//------------------- instancia
	nandgate NAND1(s,a,b);
	
	//-------------------preparacao
	initial begin:start
		a=0;b=0;
	end
	
	//-------------------parte principal
	initial begin
		$display("Exercicio0001 - Mateus Guilherme do Carmo Cruz - 427446");
		$display("Test NAND gate");
		$display("\na ~& b = s\n");
		$monitor("%b ~& %b = %b",a,b,s);
		#1 a=0;b=1;
		#1 a=1;b=0;
		#1 a=1;b=1;
	end

endmodule//testnandgate
