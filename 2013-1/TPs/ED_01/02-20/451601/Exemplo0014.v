// Nome: Matheus Filipe Sieiro Vargas
// Matricula: 451601
module andgate1 (output s, input  p, input q);

assign s = p&q;

endmodule

module andgate2 (output s2, input  p, input q, input r);

andgate1 AND1 (s, p, q);
assign s2 = s&r;

endmodule

module testeandgate;

	reg a,b,c;
	wire s;
	
	andgate2 AND2 (s, a, b, c);
	
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