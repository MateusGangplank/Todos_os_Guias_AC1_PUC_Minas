// ----------------------------------------
// Exercício0001 - NAND
// Nome: João Henrique Mendes de Oliveira
// Matricula: 392734
// ----------------------------------------

// -------------------------
// -- nand gate
// -------------------------

module nandgate(output s, input p, input q);
	assign s = ~(p & q);
endmodule //-- end nandgate

// -------------------------
// -- test nandgate
// -------------------------

module testnandgate;
	reg a, b;
	wire s;
	
	nandgate NAND1(s, a, b);
	
	initial begin:start
		a = 0; b = 0;
	end
	
	initial begin:main
		$display("Exercício0001 - João Henrique - 392734");
		$display("Test NAND gate");
		$display("\n~(a & b) = s\n");
		
		a = 0; b = 0;
	#1 $display("~(%b & %b) = %b", a, b, s);
		a = 0; b = 1;
	#1 $display("~(%b & %b) = %b", a, b, s);
		a = 1; b = 0;
	#1 $display("~(%b & %b) = %b", a, b, s);
		a = 1; b = 1;
	#1 $display("~(%b & %b) = %b", a, b, s);

	end
	
endmodule