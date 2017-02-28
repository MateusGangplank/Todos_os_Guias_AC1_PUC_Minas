// ----------------------------------------
// Exercício0004 - NOR + De Morgan
// Nome: João Henrique Mendes de Oliveira
// Matricula: 392734
// ----------------------------------------

// -------------------------
// -- nor gate
// -------------------------

module norgate(output s, input p, input q);
	assign s = ~p & ~q;
endmodule //-- norgate

// -------------------------
// -- test nor gate
// -------------------------

module testnorgate;
	reg a, b;
	wire s;
	
	norgate NOR1(s, a, b);
	
	initial begin:start
		a = 0; b = 0;
	end //-- start

	initial begin:main
		$display("Exercício0005 - João Henrique - 392734");
		$display("Test NOR gate");
		$display("\n~a & ~b = s\n");
		
		a = 0; b = 0;
	#1 $display("~%b & ~%b = %b", a, b, s);
		a = 0; b = 1;
	#1 $display("~%b & ~%b = %b", a, b, s);
		a = 1; b = 0;
	#1 $display("~%b & ~%b = %b", a, b, s);
		a = 1; b = 1;
	#1 $display("~%b & ~%b = %b", a, b, s);
	
	end //-- main

endmodule //-- testnorgate