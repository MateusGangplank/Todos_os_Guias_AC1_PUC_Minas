// ----------------------------------------
// Exercício0006 - XOR
// Nome: João Henrique Mendes de Oliveira
// Matricula: 392734
// ----------------------------------------

// -------------------------
// -- xor gate
// -------------------------

module xorgate(output s, input p, input q);
	assign s = (~p*q) | (p*~q);
endmodule //-- xorgate

// -------------------------
// -- test xor gate
// -------------------------

module testxorgate;
//-- dados locais
	reg a, b;
	wire s;
	
	xorgate XOR1(s, a, b);
	
	initial begin:start
		a = 0; b = 0;
	end //-- start

	initial begin:main
		$display("Exercício0006 - João Henrique - 392734");
		$display("Test XOR gate");
		$display("\n~ab | a~b = s\n");
		$monitor("~%b%b + %b~%b = %b", a, b, a, b, s);
		
	#1 a = 0; b = 0;
	#1 a = 0; b = 1;
	#1 a = 1; b = 0;
	#1 a = 1; b = 1;
	
	end //-- main

endmodule //-- testxorgate