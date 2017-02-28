// ------------------------- 
// Exemplo0007 - NOR 
// Nome: André Henriques Fernandes 
// Matricula: 427386 
// ------------------------- 
 
// --------------------- 
// -- nor gate 
// ---------------------

module norgate (output s, input p, input q);
	assign s = ~(p|q);
endmodule //norgate

// --------------------- 
// -- test norgate 
// --------------------- 

module testnorgate;
	reg a,b;
	wire s;
	norgate NOR1 (s,a,b);
	initial begin:start
		a=0;
		b=0;
	end
	initial begin:main
		$display("~(a|b) = s");
		$monitor("~(%b | %b) = %b",a,b,s);
		#1 a=0; b=1;
		$monitor("~(%b | %b) = %b",a,b,s);
		#1 a=1; b=0;
		$monitor("~(%b | %b) = %b",a,b,s);
		#1 a=1; b=1;
		$monitor("~(%b | %b) = %b",a,b,s);
	end
endmodule