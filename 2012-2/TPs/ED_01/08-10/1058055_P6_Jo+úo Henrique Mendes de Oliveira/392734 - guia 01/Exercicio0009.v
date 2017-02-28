// ----------------------------------------
// Exercício0009 - AND
// Nome: João Henrique Mendes de Oliveira
// Matricula: 392734
// ----------------------------------------

// -------------------------
// -- and gate
// -------------------------

module andgate01(output s01, input p, q);
	assign s01 = p & q;
endmodule //-- andgate01

module andgate02(output s02, input r, t);
	assign s02 = r & t;
endmodule //-- andgate02

module andgate(output s, input s01, s02);
	assign s = s01 & s02;
endmodule //-- andgate

// -------------------------
// -- test andgate
// -------------------------

module testandgate;
	reg a, b, c, d;
	wire s01, s02, s;
	
	andgate AND1(s01, a, b);
	andgate AND2(s02, c, d);
	andgate AND3(s, s01, s02);
	
	initial begin:start
		a = 0; b = 0; c = 0; d = 0;
	end //-- start
	
	initial begin:main
		$display("Exercício0009 - João Henrique - 392734");
		$display("Test AND gate");
		$display("\na & b & c & d = s\n");
		$monitor("%b & %b & %b & %b = %b", a, b, c, d, s);
		
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

endmodule //-- testandgate