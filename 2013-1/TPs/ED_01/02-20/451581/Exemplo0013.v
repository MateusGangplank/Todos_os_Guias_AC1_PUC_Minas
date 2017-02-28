// Exemplo0008 - AND - Morgan
// Nome: Ítalo Guimarães Otoni
// Matricula: 451581

module andgate (output s, input p, input q, input r);

	assign s = p & q & r;

endmodule

module testeandgate;

	reg a,b,c;
	wire s;
	
	andgate AND1(s, a, b, c);
	
	initial begin:start
	
	a=0;
	b=0;
	c=0;
	
	end
	
	initial begin:main
	
	$display("Exemplo0008 - Ítalo Guimarães Otoni - 451581");
	$monitor ("%b %b %b = %b", a, b, c, s);
	
	#1 a=0; b=0; c=1;
	#1 a=0; b=1; c=0;
	#1 a=0; b=1; c=1;
	#1 a=1; b=0; c=0;
	#1 a=1; b=0; c=1;
	#1 a=1; b=1; c=0;
	#1 a=1; b=1; c=1;

	end

endmodule