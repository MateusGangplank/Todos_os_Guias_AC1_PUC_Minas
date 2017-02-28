// Exercicio10 - OR  
// Nome: Roger Rubens Machado 
// Matricula: 430533

// -- or gate

module orgate(output s, input p, input q);
 assign s = p | q;
endmodule // orgate

module testorgate;
 reg a, b, c;
 wire s1, s2;
 
orgate AND1 (s1, a, b); 
orgate AND2 (s, s1, c);

initial begin: start
	a = 0;
	b = 0;
	c = 0;
end

initial begin: main
	$display("Exercicio0010 - Roger Rubens Machado - 427460"); 
	$display("Test or gate"); 
	$display("\na &  b & c = s\n"); 
		a=0; b=0; c=0; 
	#1 $display("%b & %b & %b = %b", a, b, c, s); 
		a=0; b=0; c=1; 
	#1 $display("%b & %b & %b = %b", a, b, c, s); 
		a=0; b=1; c=0; 
	#1 $display("%b & %b & %b = %b", a, b, c, s); 
		a=0; b=1; c=1; 
	#1 $display("%b & %b & %b = %b", a, b, c, s); 
		a=1; b=0; c=0; 
	#1 $display("%b & %b & %b = %b", a, b, c, s);
		a=1; b=0; c=1; 
	#1 $display("%b & %b & %b = %b", a, b, c, s);
		a=1; b=1; c=0; 
	#1 $display("%b & %b & %b = %b", a, b, c, s);
		a=1; b=1; c=1; 
	#1 $display("%b & %b & %b = %b", a, b, c, s);
end 
endmodule // testandgate 	

