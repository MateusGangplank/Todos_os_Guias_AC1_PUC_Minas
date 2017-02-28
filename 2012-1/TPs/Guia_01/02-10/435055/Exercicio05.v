// Exercicio05 - nor
// Nome: Samuel Eusébio da Silva
// Matricula: 435055

// nor gate

	module norgate (output s, input p, input q);
	assign s = (~(p)&~(q));
	endmodule //--nor
	
	//--test norgate
	
	module testnorgate;
	
	reg a,b;
	wire s;
	
	norgate NOR2 (s, a, b);
	
	initial begin:start
	a=0;b=0;
	end
	
	initial begin:main
	$display("Exercicio05 - Samuel Eusébio da Silva - 435055"); 
	$display("Test nor gate");
	$display("\n (~(a)&~(b)) = s\n");
	$monitor("%b ~&~ %b = %b", a, b, s);
	#1 a=0; b=0;
	#1 a=0; b=1;
	#1 a=1; b=0;
	#1 a=1; b=1;
	end
	endmodule //--testnorgate