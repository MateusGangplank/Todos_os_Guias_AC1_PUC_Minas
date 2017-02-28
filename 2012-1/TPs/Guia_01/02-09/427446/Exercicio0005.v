//--------------------------------------
//Exercicio0005 - NOR com DeMorgan
//Nome: Mateus Guilherme do Carmo Cruz
//Matrícula: 427446
//---------------------------------------

//------------------
//-- nor gate
//------------------

module norgate(output s,
						input p,
						input q);
	assign s = (~p)&(~q);
endmodule//norgate

//--------------------
//-- test nor gate
//--------------------

module testnorgate;
	//------------ definir dados
	reg a,b;	//definir registradores
	wire s;	//conexão(fio)
	
	//------------------- instancia
	norgate NOR1(s,a,b);
	
	//-------------------preparacao
	initial begin:start
		a=0;b=0;
	end
	
	//-------------------parte principal
	initial begin
		$display("Exercicio0002 - Mateus Guilherme do Carmo Cruz - 427446");
		$display("Test NOR gate com DeMorgan");
		$display("\na ~| b = s\n");
		$monitor("%b ~| %b = %b",a,b,s);
		#1 a=0;b=1;
		#1 a=1;b=0;
		#1 a=1;b=1;
	end

endmodule//testnorgate
