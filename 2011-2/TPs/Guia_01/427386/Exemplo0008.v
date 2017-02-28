// ------------------------- 
// Exemplo0008 - XNOR 
// Nome: André Henriques Fernandes 
// Matricula: 427386 
// ------------------------- 
 
// --------------------- 
// -- xnor gate 
// ---------------------

module xnorgate (output s, input p, input q);
	assign s = ~(p^q);
endmodule // xnorgate

module testxnorgate;
	reg a,b;
	wire s;
	xnorgate XNOR1 (s, a, b);
	initial begin:start
		a=0;
		b=0;
	end
	initial begin:main
		$display("~(a ^ b) = s");
		$monitor("~(%b ^ %b) = %b",a,b,s);
		#1 a=0; b=1;
		$monitor("~(%b ^ %b) = %b",a,b,s);
		#1 a=1; b=0;
		$monitor("~(%b ^ %b) = %b",a,b,s);
		#1 a=1; b=1;
		$monitor("~(%b ^ %b) = %b",a,b,s);
	end
endmodule //testxnorgate