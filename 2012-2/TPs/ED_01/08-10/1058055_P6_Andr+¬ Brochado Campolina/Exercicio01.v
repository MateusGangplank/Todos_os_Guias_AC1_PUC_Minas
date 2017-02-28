//-----
//Exercicio 01
//Andre Campolina
//381217
//-----

//-----
//porta nand
//-----

module nandgate (output s, input p, input q);
	assign s=(~(p&q));
endmodule //nandgate

//----
//tabela verdade
//----

module testnand;
	reg a, b;
	wire s;
	
	nandgate NAND1(s, a, b);
	
	initial begin:start
		a=0; b=0;
	end
	
	initial begin
		$display("Exercicio01 - Andre Campolina - 381217");
		$display("Tabela Verdade porta NAND");
		$display("\na b\ts\n");
		$monitor("%b %b\t%b",a,b,s);
		#1 b=1;
		#1 a=1; b=0;
		#1 b=1;
	end
endmodule //testnand