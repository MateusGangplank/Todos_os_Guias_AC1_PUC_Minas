//--------------------------------------------
// Exercício0002 - OR
// Nome: Mateus Guilherme do Carmo Cruz
// Matrícula - 427446
//-----------------------------------------

module norgate(output s, input a, input b);
	assign s = ~(a|b);
endmodule //norgate

//------------
//--executar nor gate
//--------------------

module testnorgate;
	reg a,b; //registradores
	wire s; // conexão(fio)
//----------instancia
	norgate NOR1(s,a,b);
//--------------preparação
	initial begin:start
	a=0; b=0;
	end
//-------------parte principal
	initial begin
	$display("Exercício0002 - Mateus Guilherme do Carmo Cruz - 427446");
	$display("Executa NOR gate.");
	$display("\t	time\t~(a|b) = s");
	$monitor("%d\t~(%b|%b) = %b",$time,a,b,s);
	a=0;b=0;
	
	#1 a=0;b=1;
	#1 a=1;b=0;
	#1 a=1;b=1;
	
	end
	
endmodule //norgate