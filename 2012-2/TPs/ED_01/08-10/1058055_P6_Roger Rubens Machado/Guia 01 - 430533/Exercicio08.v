// Exercicio08 - AND  
// Nome: Roger Rubens Machado 
// Matricula: 430533

// -- and gate

module andgate(output s, input p, input q, input r, input y);
 assign s = p & q & r & y;
endmodule // andgate

module testandgate;
 reg a, b, c, d;
 wire s;
 
andgate AND(s, a, b, c, d);

initial begin: start
	a = 0;
	b = 0;
	c = 0;
	d = 0;
end

initial begin: main
	$display("Exercicio0008 - Roger Rubens Machado - 430533"); 
	$display("Test AND gate"); 
	$display("\na &  b & c & d = s\n"); 
		a = 0; b = 0; c = 0; 
	$monitor("%b & %b & %b & %b = %b", a, b, c, d, s); 
		#1 a = 0; b = 0; c = 0; d = 0;
		#1 a = 1; b = 0; c = 0; d = 0;
		#1 a = 0; b = 1; c = 0; d = 0;
		#1 a = 1; b = 1; c = 0; d = 0;
		#1 a = 0; b = 0; c = 1; d = 0;
		#1 a = 1; b = 0; c = 1; d = 0;
		#1 a = 0; b = 1; c = 1; d = 0;
		#1 a = 1; b = 1; c = 1; d = 0;
		#1 a = 0; b = 0; c = 0; d = 1;
		#1 a = 1; b = 0; c = 0; d = 1;
		#1 a = 0; b = 1; c = 0; d = 1;
		#1 a = 1; b = 1; c = 0; d = 1;
		#1 a = 0; b = 0; c = 1; d = 1;
		#1 a = 1; b = 0; c = 1; d = 1;
		#1 a = 0; b = 1; c = 1; d = 1;
		#1 a = 1; b = 1; c = 1; d = 1;
end 
endmodule // testandgate 