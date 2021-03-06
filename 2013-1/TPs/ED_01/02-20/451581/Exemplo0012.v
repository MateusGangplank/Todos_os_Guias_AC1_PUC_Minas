// Exemplo0008 - XNOR - Morgan
// Nome: �talo Guimar�es Otoni
// Matricula: 451581

module xnorgate (output s, input p, input q);

	assign s = p & q + ~p & ~q;

endmodule

module testexnorgate;

	reg a,b;
	wire s;
	
	xnorgate XNOR1(s, a, b);
	
	initial begin:start
	
	a=0;
	b=0;
	
	end
	
	initial begin:main
	
	$display("Exemplo0008 - �talo Guimar�es Otoni - 451581");
	$monitor ("%b %b = %b", a, b, s);
	
	#1 a=0; b=1;
	#1 a=1; b=0;
	#1 a=1; b=1;
	end

endmodule