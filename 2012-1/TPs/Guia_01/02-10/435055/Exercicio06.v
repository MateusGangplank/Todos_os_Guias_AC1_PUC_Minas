// Exercicio06 - xor
// Nome: Samuel Eusébio da Silva
// Matricula: 435055

// xor gate

	module xorgate (output s, input p, input q);
	assign s = ((~p)&q) + (p&(~q));
	endmodule //--xor
	
	//--test xorgate
	
	module testxorgate;
	
	reg a,b;
	wire s;
	
	xorgate XOR1 (s, a, b);
	
	initial begin:start
	a=0;b=0;
	end
	
	initial begin:main
	$display("Exercicio06 - Samuel Eusébio da Silva - 435055"); 
	$display("Test xor gate");
	$display("\n ((~a)&b) + (a&(~b)) = s\n");
	$monitor("%b xor %b = %b", a, b, s);
	#1 a=0; b=0;
	#1 a=0; b=1;
	#1 a=1; b=0;
	#1 a=1; b=1;
	end
	endmodule //--testnorgate