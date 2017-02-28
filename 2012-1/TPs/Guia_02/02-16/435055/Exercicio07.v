// ------------------------- 
// Exercicio07
// Nome: Samuel Eusébio da Silva
// Matricula: 435055
// -------------------------

	module exercicio07 (output [7:0] s, input [7:0] p);
	assign s = -p;
	endmodule // exercicio07

	module test_exercicio07; 
	// ------------------------- definir dados 
	reg [7:0] a; 
	wire [7:0] s; 
	
	exercicio07 TEST1 (s, a);
	
	initial begin:start
	a=0;
	end
	
	// ------------------------- parte principal 
	initial begin:main
	$display("Exercicio07 - Samuel Eusébio da Silva - 435055"); 
	$display("Test");
	$monitor("Complemento de 2 de %8b = %8b", a, s);
	#1 a = 8'b01010100;
	#1 a = 8'b11101011;
	#1 a = 8'b01011001;

	end 
	endmodule // test_exercicio07