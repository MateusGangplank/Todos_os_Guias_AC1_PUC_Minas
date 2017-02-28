// ----------------------------------------
// Exercício0003 - XNOR
// Nome: João Henrique Mendes de Oliveira
// Matricula: 392734
// ----------------------------------------

// -------------------------
// -- xnor gate
// -------------------------

module xnorgate(output s, input p, q);
	assign s = ~(p ^ q);
endmodule //-- xnorgate

// -------------------------
// -- test xnorgate
// -------------------------

module testxnorgate;
	reg a, b;
	wire s;
	
	xnorgate XNOR1(s, a, b);
	
	initial begin:start
		a = 0; b = 0;
	end //-- start
	
	initial begin:main
		$display("Exercício0003 - João Henrique - 392734");
		$display("Test XNOR gate");
		$display("\n ~(a ^ b) = s\n");
		$monitor("~(%b ^ %b) = %b", a, b, s);
		
	#1 a = 0; b = 0;
	#1 a = 0; b = 1;
	#1 a = 1; b = 0;
	#1 a = 1; b = 1;
	
	end //-- main
	
endmodule //-- testxnorgate