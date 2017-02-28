// Exercicio11 - compare1
// Nome: Samuel Eusébio da Silva
// Matricula: 435055

// compare1 gate

	module compare1gate (output s, input [7:0] p);
	nor nor1 (s, p);
	endmodule //--compare1
	
	//--test compare1gate
	
	module testcompare1gate;
	
	reg [7:0] a;
	wire s;
	
	compare1gate COMP1 (s, a);
	
	initial begin:start
	a=00000000;
	end
	
	initial begin:main
	$display("Exercicio11 - Samuel Eusébio da Silva - 435055"); 
	$display("Test compare1 gate");
	$monitor("%b = %b", a, s);
	#1 a=10000001;
	#1 a=10101111;
	#1 a=00100111;
	#1 a=00000101;
	#1 a=11111111;
	end
	endmodule //--testcompare1gate