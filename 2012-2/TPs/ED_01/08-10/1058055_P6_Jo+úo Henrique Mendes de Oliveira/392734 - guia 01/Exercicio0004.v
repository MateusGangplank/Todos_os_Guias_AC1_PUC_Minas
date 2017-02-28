// ----------------------------------------
// Exercício0004 - NAND + De Morgan
// Nome: João Henrique Mendes de Oliveira
// Matricula: 392734
// ----------------------------------------

// -------------------------
// -- nand gate
// -------------------------

module nandgate(output s, input p, q);
	assign s = ~p | ~q;
endmodule //-- nandgate

// -------------------------
// -- test nand gate
// -------------------------

module testnandgate;
	reg a, b;
	wire s;
	
	nandgate NAND1(s, a, b);
	
	initial begin:start
		a = 0; b = 0;
	end //-- start

	initial begin:main
		$display("Exercício0004 - João Henrique - 392734");
		$display("Test NAND gate");
		$display("\n~a | ~b = s\n");
		
		a = 0; b = 0;
	#1 $display("~%b | ~%b = %b", a, b, s);
		a = 0; b = 1;
	#1 $display("~%b | ~%b = %b", a, b, s);
		a = 1; b = 0;
	#1 $display("~%b | ~%b = %b", a, b, s);
		a = 1; b = 1;
	#1 $display("~%b | ~%b = %b", a, b, s);
	
	end //-- main

endmodule //-- testnandgate