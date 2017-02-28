// Exemplo0008 - NAND - Morgan
// Nome: �talo Guimar�es Otoni
// Matricula: 451581

module nandgate (output s, input p, input q);

	assign s = ~p | ~q;

endmodule

module testenandgate;

	reg a,b;
	wire s;
	
	nandgate NAND1(s, a, b);
	
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