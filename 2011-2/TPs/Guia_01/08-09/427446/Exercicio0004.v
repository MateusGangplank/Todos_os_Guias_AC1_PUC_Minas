//--------------------
// Exercício0004 - porta AND com três entradas
// Nome: Mateus Guilherme do Carmo Cruz
// Matrícula: 427446
// ----------------------

//--and gate

module andgate(output s, input a, input b, input c);
	assign s = a&(b&c);
endmodule

//-- test andgate

module runandgate;
	reg a,b,c; //registradores
	wire s; //conexão(fio)
	
	//--instância
	andgate AND1(s,a,b,c);
	
	//inicialização
	initial begin:start
		a=0;b=0;c=0;
	end
	
	//--parte principal
	initial begin:main
		$display("Exercicio0004 - Mateus Guilherme do Carmo Cruz - 427446");
		$display("Porta AND com 3 entradas.");
		$display("\ns=a&(b&c)\n");
		a=0;b=0;c=0;
		$monitor("%b&(%b&%b)=%b",a,b,c,s);
	#1 a=0;b=0;c=1;
	#1 a=0;b=1;c=0;
	#1 a=0;b=1;c=1;
	#1	a=1;b=0;c=0;
	#1	a=1;b=0;c=1;
	#1 a=1;b=1;c=0;
	#1 a=1;b=1;c=1;
	end //main
	
endmodule //runandgate