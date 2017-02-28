// Exercicio10 - or
// Nome: Samuel Eusébio da Silva
// Matricula: 435055

// or gate

	module orgate (output s, input p, input q);
	assign s = p | q;
	endmodule //--or
	
	//--test orgate
	
	module testorgate;
	
	reg a,b,c;
	wire s1, s2;
	
	orgate OR2 (s1, a, b);
	orgate OR3 (s2, s1, c);
	
	initial begin:start
	a=0;b=0;c=0;
	end
	
	initial begin:main
	$display("Exercicio10 - Samuel Eusébio da Silva - 435055"); 
	$display("Test or gate");
	$display("\n a | b | c = s\n");
	$monitor("%b | %b | %b = %b", a, b, c, s2);
	#1 a=0; b=0; c=0;
	#1 a=0; b=0; c=1;
	#1 a=0; b=1; c=0;
	#1 a=0; b=1; c=1;
	#1 a=1; b=0; c=0;
	#1 a=1; b=0; c=1;
	#1 a=1; b=1; c=0;
	#1 a=1; b=1; c=1;
	end
	endmodule //--testorgate