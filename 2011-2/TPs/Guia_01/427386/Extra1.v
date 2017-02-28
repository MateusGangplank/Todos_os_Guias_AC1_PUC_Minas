// ------------------------- 
// Exemplo0011 - circuito
// Nome: André Henriques Fernandes 
// Matricula: 427386 
// ------------------------- 
 
// --------------------- 
// -- circuito
// ---------------------

module andgate (output [0:3] s, input [0:3] p, input [0:3] q);
	assign s = ~p & ~q;
endmodule //andgate

module testandgate;
	reg [0:3] a,b;
	wire [0:3] s;
	andgate AND1 (s,a,b);
	initial begin:start
		a=4'b0000;
		b=4'b0000;
	end
	initial begin:main
		$monitor("%b%b",a,b);
	end
endmodule //testandgate