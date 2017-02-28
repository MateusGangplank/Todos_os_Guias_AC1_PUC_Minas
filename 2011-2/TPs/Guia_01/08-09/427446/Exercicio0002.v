//--------------------------------------------
// Exerc�cio0002 - OR
// Nome: Mateus Guilherme do Carmo Cruz
// Matr�cula - 427446
//-----------------------------------------

module norgate(output s, input a, input b);
	assign s = ~(a|b);
endmodule //norgate

//------------
//--executar nor gate
//--------------------

module testnorgate;
	reg a,b; //registradores
	wire s; // conex�o(fio)
//----------instancia
	norgate NOR1(s,a,b);
//--------------prepara��o
	initial begin:start
	a=0; b=0;
	end
//-------------parte principal
	initial begin
	$display("Exerc�cio0002 - Mateus Guilherme do Carmo Cruz - 427446");
	$display("Executa NOR gate.");
	$display("\t	time\t~(a|b) = s");
	$monitor("%d\t~(%b|%b) = %b",$time,a,b,s);
	a=0;b=0;
	
	#1 a=0;b=1;
	#1 a=1;b=0;
	#1 a=1;b=1;
	
	end
	
endmodule //norgate