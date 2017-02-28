// ------------------------- 
// Exemplo0009 - AND
// Nome: André Henriques Fernandes 
// Matricula: 427386 
// ------------------------- 
 
// --------------------- 
// -- and gate 
// ---------------------

module andgate (output s, input p, input q, input r);
	assign s = (p & q) & r;
endmodule // andgate2

module testandgate2;
	reg a, b, c;
	wire s;
	
	andgate AND1 (s, a, b, c);
	
	initial begin:start
		a=0;
		b=0;
		c=0;
	end
	initial begin:main
		$display("a & b & c = s\n");
		$monitor("%b & %b & %b = %b",a,b,c,s);
		#1 a=0; b=0; c=1;
		$monitor("%b & %b & %b = %b",a,b,c,s);
		#1 a=0; b=1; c=0;
		$monitor("%b & %b & %b = %b",a,b,c,s);
		#1 a=0; b=1; c=1;
		$monitor("%b & %b & %b = %b",a,b,c,s);
		#1 a=1; b=0; c=0;
		$monitor("%b & %b & %b = %b",a,b,c,s);
		#1 a=1; b=0; c=1;
		$monitor("%b & %b & %b = %b",a,b,c,s);
		#1 a=1; b=1; c=0;
		$monitor("%b & %b & %b = %b",a,b,c,s);
		#1 a=1; b=1; c=1;
		$monitor("%b & %b & %b = %b",a,b,c,s);
		
		
	end
endmodule //testandgate2