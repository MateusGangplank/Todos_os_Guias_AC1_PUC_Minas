// ----------------------------------------
// Exercício0002 - NOR
// Nome: João Henrique Mendes de Oliveira
// Matricula: 392734
// ----------------------------------------

// -------------------------
// -- nor gate
// -------------------------

module norgate(output s, input p, input q);
	assign s = ~(p | q);
endmodule //-- norgate

// -------------------------
// -- test norgate
// -------------------------

module testnorgate;
	reg a, b;
	wire s;
	
	norgate NOR1(s, a, b);
	
	initial begin:start
		a = 0; b = 0;
	end //-- start
	
	initial begin:main
		$display("Exercício0002 - João Henrique - 392734");
		$display("Test NOR gate");
		$display("\n ~(a | b) = s\n");
		$monitor("~(%b | %b) = %b", a, b, s);
		
	#1 a = 0; b = 0;
	#1 a = 0; b = 1;
	#1 a = 1; b = 0;
	#1 a = 1; b = 1;
	
	end //-- main
	
endmodule //-- testnorgate

