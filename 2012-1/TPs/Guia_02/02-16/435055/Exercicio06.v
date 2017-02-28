// ------------------------- 
// Exercicio06
// Nome: Samuel Eusébio da Silva
// Matricula: 435055
// -------------------------

	module exercicio06 (output [7:0] s, input [7:0] p);
	assign s = ~p;
	endmodule // exercicio06 

	module test_exercicio06; 
	// ------------------------- definir dados 
	reg [7:0] a; 
	wire [7:0] s; 
	
	exercicio06 TEST1 (s, a);
	
	initial begin:start
	a=0;
	end
	
	// ------------------------- parte principal 
	initial begin:main
	$display("Exercicio06 - Samuel Eusébio da Silva - 435055"); 
	$display("Test");
	$monitor("Complemento de 1 de %8b = %8b", a, s);
	#1 a = 8'b01010100;
	#1 a = 8'b11101011;
	#1 a = 8'b01011001;

	end 
	endmodule // test_exercicio06