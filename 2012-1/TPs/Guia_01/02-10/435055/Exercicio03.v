// Exercicio03 - xnor
// Nome: Samuel Eusébio da Silva
// Matricula: 435055

// xnor gate

	module xnorgate (output s, input p, input q);
	assign s = (~(p^q));
	endmodule //--xnor
	
	//--test xnorgate
	
	module testxnorgate;
	
	reg a,b;
	wire s;
	
	xnorgate XNOR1 (s, a, b);
	
	initial begin:start
	a=0;b=0;
	end
	
	initial begin:main
	$display("Exercicio03 - Samuel Eusébio da Silva - 435055"); 
	$display("Test xnor gate");
	$display("\n (~(a^b)) = s\n");
	$monitor("%b ~^ %b = %b", a, b, s);
	#1 a=0; b=0;
	#1 a=0; b=1;
	#1 a=1; b=0;
	#1 a=1; b=1;
	end
	endmodule //--testxnorgate