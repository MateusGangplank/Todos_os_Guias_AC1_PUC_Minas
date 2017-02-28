// ----------------------------------------
// Exercício0008 - AND
// Nome: João Henrique Mendes de Oliveira
// Matricula: 392734
// ----------------------------------------

// -------------------------
// -- and gate
// -------------------------

module andgate(output s, input p, q, r, t);
	assign s = p & q & r & t;
endmodule //-- andgate

// -------------------------
// -- test andgate
// -------------------------

module testandgate;
	reg a, b, c, d;
	wire s;
	
	andgate AND1(s, a, b, c, d);
	
	initial begin:start
		a = 0; b = 0; c = 0; d = 0;
	end //-- start
	
	initial begin:main
		$display("Exercício0008 - João Henrique - 392734");
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