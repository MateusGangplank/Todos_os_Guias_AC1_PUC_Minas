//-----
//Exercicio 07
//Andre Campolina
//381217
//-----

//-----
//porta xnor
//-----

module xnorgate (output s, input p, input q);
	assign s=(((p)|(~q))&(~p|q));
endmodule //xnorgate

//----
//tabela verdade
//----

module testxnor;
	reg a, b;
	wire s;
	
	xnorgate XNOR1(s, a, b);
	
	initial begin:start
		a=0; b=0;
	end
	
	initial begin
		$display("Exercicio07 - Andre Campolina - 381217");
		$display("Tabela Verdade porta XNOR");
		$display("\na b\ts\n");
		$monitor("%b %b\t%b",a,b,s);
		#1 b=1;
		#1 a=1; b=0;
		#1 b=1;
	end
endmodule //testxnor