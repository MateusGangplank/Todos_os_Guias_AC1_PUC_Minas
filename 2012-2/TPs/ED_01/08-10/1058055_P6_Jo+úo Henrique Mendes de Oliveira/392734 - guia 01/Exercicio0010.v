// ----------------------------------------
// Exercício0010 - OR
// Nome: João Henrique Mendes de Oliveira
// Matricula: 392734
// ----------------------------------------

// -------------------------
// -- or gate
// -------------------------

module orgate01(output s01, input p, q);
	assign s01 = p | q;
endmodule //-- orgate01

module orgate02(output s02, input r, t);
	assign s02 = r | t;
endmodule //-- orgate02

module orgate(output s, input s01, s02);
	assign s = s01 | s02;
endmodule //-- orgate

// -------------------------
// -- test orgate
// -------------------------

module testorgate;
	reg a, b, c, d;
	wire s01, s02, s;
	
	orgate OR1(s01, a, b);
	orgate OR2(s02, c, d);
	orgate OR3(s, s01, s02);
	
	initial begin:start
		a = 0; b = 0; c = 0; d = 0;
	end //-- start
	
	initial begin:main
		$display("Exercício0009 - João Henrique - 392734");
		$display("Test OR gate");
		$display("\na | b | c | d = s\n");
		$monitor("%b | %b | %b | %b = %b", a, b, c, d, s);
		
	#1 a = 0; b = 0; c = 0; d = 0;
	#1 a = 0; b = 0; c = 0; d = 1;
	#1 a = 0; b = 0; c = 1; d = 0;
	#1 a = 0; b = 0; c = 1; d = 1;
	#1 a = 0; b = 1; c = 0; d = 0;
	#1 a = 0; b = 1; c = 0; d = 1;
	#1 a = 0; b = 1; c = 1; d = 0;
	#1 a = 0; b = 1; c = 1; d = 1;
	#1 a = 1; b = 0; c = 0; d = 0;
	#1 a = 1; b = 0; c = 0; d = 1;
	#1 a = 1; b = 0; c = 1; d = 0;
	#1 a = 1; b = 0; c = 1; d = 1;
	#1 a = 1; b = 1; c = 0; d = 0;
	#1 a = 1; b = 1; c = 0; d = 1;
	#1 a = 1; b = 1; c = 1; d = 0;
	#1 a = 1; b = 1; c = 1; d = 1;
	
	end //-- main

endmodule //-- testorgate