//-----
//Exercicio 06
//Andre Campolina
//381217
//-----

//-----
//porta xor
//-----

module xorgate (output s, input p, input q);
	assign s=(((~p)|(~q))&(p|q));
endmodule //xorgate

//----
//tabela verdade
//----

module testxor;
	reg a, b;
	wire s;
	
	xorgate XOR1(s, a, b);
	
	initial begin:start
		a=0; b=0;
	end
	
	initial begin
		$display("Exercicio06 - Andre Campolina - 381217");
		$display("Tabela Verdade porta XOR");
		$display("\na b\ts\n");
		$monitor("%b %b\t%b",a,b,s);
		#1 b=1;
		#1 a=1; b=0;
		#1 b=1;
	end
endmodule //testxor