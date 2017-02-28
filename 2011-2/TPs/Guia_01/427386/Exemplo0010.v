// ------------------------- 
// Exemplo0010 - OR
// Nome: André Henriques Fernandes 
// Matricula: 427386 
// ------------------------- 
 
// --------------------- 
// -- or gate 
// ---------------------

module orgate (output s, input p, input q, input r);
	assign s = (p | q) | r;
endmodule // orgate

module testorgate;
	reg a,b,c;
	wire s;
	orgate OR1 (s,a,b,c);
	initial begin:start
		a=0;
		b=0;
		c=0;
	end
	initial begin:main
		$display("a | b | c = s \n");
		$monitor("%b | %b | %b = %b",a,b,c,s);
		#1 a=0; b=0; c=1;
		$monitor("%b | %b | %b = %b",a,b,c,s);
		#1 a=0; b=1; c=0;
		$monitor("%b | %b | %b = %b",a,b,c,s);
		#1 a=0; b=1; c=1;
		$monitor("%b | %b | %b = %b",a,b,c,s);
		#1 a=1; b=0; c=0;
		$monitor("%b | %b | %b = %b",a,b,c,s);
		#1 a=1; b=0; c=1;
		$monitor("%b | %b | %b = %b",a,b,c,s);
		#1 a=1; b=1; c=0;
		$monitor("%b | %b | %b = %b",a,b,c,s);
		#1 a=1; b=1; c=1;
		$monitor("%b | %b | %b = %b",a,b,c,s);
	end
endmodule //testorgate