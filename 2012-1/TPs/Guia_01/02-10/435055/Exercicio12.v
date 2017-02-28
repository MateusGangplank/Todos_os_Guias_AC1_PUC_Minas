// Exercicio12 - compare2
// Nome: Samuel Eusébio da Silva
// Matricula: 435055

// compare2 gate

	module compare2gate (output s, input [7:0] p);
	or or1 (s, p);
	endmodule //--compare2
	
	//--test compare2gate
	
	module testcompare2gate;
	
	reg [7:0] a;
	wire s;
	
	compare2gate COMP2 (s, a);
	
	initial begin:start
	a=11111111;
	end
	
	initial begin:main
	$display("Exercicio12 - Samuel Eusébio da Silva - 435055"); 
	$display("Test compare2 gate");
	$monitor("%b = %b", a, s);
	#1 a=10010011;
	#1 a=10101111;
	#1 a=00100111;
	#1 a=00000000;
	end
	endmodule //--testcompare2gate