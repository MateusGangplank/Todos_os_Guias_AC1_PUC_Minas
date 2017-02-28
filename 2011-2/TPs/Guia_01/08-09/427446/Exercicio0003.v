//---------------------
// Teste XNOR
// Nome: Mateus Guilherme do Carmo Cruz
// Matrícula:427446

//----------
// xnor gate
//-----------

module xnorgate(output s, input a, input b);
	assign s = ~(a^b);
endmodule //xnorgate

//-------------
// executar xnorgate
// -----------------

module runxnorgate;
	reg a,b; //registradores
	wire s; //conexão(fio);
	
	//-----instancia
	xnorgate XNOR1(s,a,b);
	
	//preparação
	initial begin:start
		a=0;b=0;
	end
	
	//----------parte principal
	initial begin
		$display("Exercicio0003 - Mateus Guilherme do Carmo Cruz - 427446");
		$display("Execução XNOR gate.");
		$display("\t	time\t~(a^b) = s\n");
		a=0; b=0;
		$monitor("%d\t~(%b^%b) = %b",$time,a,b,s);
		
		#1 a=0; b=1;
		#1 a=1; b=0;
		#1 a=1; b=1;
	end
endmodule //runxnorgate