// Exercicio08 - and
// Nome: Samuel Eusébio da Silva
// Matricula: 435055

// and gate

	module andgate (output s, input p, input q, input w);
	assign s = p & q & w;
	endmodule //--and
	
	//--test andgate
	
	module testandgate;
	
	reg a,b,c;
	wire s;
	
	andgate AND2 (s, a, b, c);
	
	initial begin:start
	a=0;b=0;c=0;
	end
	
	initial begin:main
	$display("Exercicio08 - Samuel Eusébio da Silva - 435055"); 
	$display("Test and gate");
	$display("\n p & q & w = s\n");
	$monitor("%b & %b & %b = %b", a, b, c, s);
	#1 a=0; b=0; c=0;
	#1 a=0; b=0; c=1;
	#1 a=0; b=1; c=0;
	#1 a=0; b=1; c=1;
	#1 a=1; b=0; c=0;
	#1 a=1; b=0; c=1;
	#1 a=1; b=1; c=0;
	#1 a=1; b=1; c=1;
	end
	endmodule //--testandgate