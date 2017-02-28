//---------------------------------------
//Exemplo0031 - adição/subtração de 4 bits
//Nome: Rafael Guimaraes de Sousa
//Matrícula: 451607
//---------------------------------------

`include "FullAdder.v"

module adder_subtractor(output [3:0]s, input [3:0]a,
			input [3:0]b, input carryIn);
	wire [3:0]aux;
	xor xor1(aux[0],b[0],carryIn);
	xor xor2(aux[1],b[1],carryIn);
	xor xor3(aux[2],b[2],carryIn);
	xor xor4(aux[3],b[3],carryIn);
	fullAdder4bits fa1(s,a,aux,carryIn);
endmodule //f4

module principal;
	reg [3:0]x,y;
	reg carryIn;
	wire [3:0]s;
	
	adder_subtractor as1(s,x,y,carryIn);
	
	initial begin
		x = 4'b0000;
		y = 4'b0000;
		carryIn = 0;
		$display("Exemplo0031 - Rafael Guimaraes de Sousa - 451607");
		$display("Adder/Subtractor 4bits");
		$display("CarryIn: (0) - adder  |  (1) - subtractor");
		$display("carryIn \tx +/- y = s");
		$monitor("%b \t%4b +/- %4b = %4b",carryIn,x,y,s);
		#1 carryIn = 1;
		
		#1 y = 1; carryIn = 0;
		#1 carryIn = 1;
		#1 y = 2; carryIn = 0;
		#1 carryIn = 1;
		#1 y = 3; carryIn = 0;
		#1 carryIn = 1;
		#1 y = 4; carryIn = 0;
		#1 carryIn = 1;
		#1 y = 5; carryIn = 0;
		#1 carryIn = 1;
		#1 y = 6; carryIn = 0;
		#1 carryIn = 1;
		#1 y = 7; carryIn = 0;
		#1 carryIn = 1;
		#1 y = 8; carryIn = 0;
		#1 carryIn = 1;
		#1 y = 9; carryIn = 0;
		#1 carryIn = 1;
		#1 y = 10; carryIn = 0;
		#1 carryIn = 1;
		#1 y = 11; carryIn = 0;
		#1 carryIn = 1;
		#1 y = 12; carryIn = 0;
		#1 carryIn = 1;
		#1 y = 13; carryIn = 0;
		#1 carryIn = 1;
		#1 y = 14; carryIn = 0;
		#1 carryIn = 1;
		#1 y = 15; carryIn = 0;
		#1 carryIn = 1;
		
		#1 x = 1; y = 0; carryIn = 0;
		#1 carryIn = 1;
		#1 y = 1; carryIn = 0;
		#1 carryIn = 1;
		#1 y = 2; carryIn = 0;
		#1 carryIn = 1;
		#1 y = 3; carryIn = 0;
		#1 carryIn = 1;
		#1 y = 4; carryIn = 0;
		#1 carryIn = 1;
		#1 y = 5; carryIn = 0;
		#1 carryIn = 1;
		#1 y = 6; carryIn = 0;
		#1 carryIn = 1;
		#1 y = 7; carryIn = 0;
		#1 carryIn = 1;
		#1 y = 8; carryIn = 0;
		#1 carryIn = 1;
		#1 y = 9; carryIn = 0;
		#1 carryIn = 1;
		#1 y = 10; carryIn = 0;
		#1 carryIn = 1;
		#1 y = 11; carryIn = 0;
		#1 carryIn = 1;
		#1 y = 12; carryIn = 0;
		#1 carryIn = 1;
		#1 y = 13; carryIn = 0;
		#1 carryIn = 1;
		#1 y = 14; carryIn = 0;
		#1 carryIn = 1;
		#1 y = 15; carryIn = 0;
		#1 carryIn = 1;
		
		#1 x = 2; y = 0; carryIn = 0;
		#1 carryIn = 1;
		#1 y = 1; carryIn = 0;
		#1 carryIn = 1;
		#1 y = 2; carryIn = 0;
		#1 carryIn = 1;
		#1 y = 3; carryIn = 0;
		#1 carryIn = 1;
		#1 y = 4; carryIn = 0;
		#1 carryIn = 1;
		#1 y = 5; carryIn = 0;
		#1 carryIn = 1;
		#1 y = 6; carryIn = 0;
		#1 carryIn = 1;
		#1 y = 7; carryIn = 0;
		#1 carryIn = 1;
		#1 y = 8; carryIn = 0;
		#1 carryIn = 1;
		#1 y = 9; carryIn = 0;
		#1 carryIn = 1;
		#1 y = 10; carryIn = 0;
		#1 carryIn = 1;
		#1 y = 11; carryIn = 0;
		#1 carryIn = 1;
		#1 y = 12; carryIn = 0;
		#1 carryIn = 1;
		#1 y = 13; carryIn = 0;
		#1 carryIn = 1;
		#1 y = 14; carryIn = 0;
		#1 carryIn = 1;
		#1 y = 15; carryIn = 0;
		#1 carryIn = 1;
		
		#1 x = 15; y = 0; carryIn = 0;
		#1 carryIn = 1;
		#1 y = 1; carryIn = 0;
		#1 carryIn = 1;
		#1 y = 2; carryIn = 0;
		#1 carryIn = 1;
		#1 y = 3; carryIn = 0;
		#1 carryIn = 1;
		#1 y = 4; carryIn = 0;
		#1 carryIn = 1;
		#1 y = 5; carryIn = 0;
		#1 carryIn = 1;
		#1 y = 6; carryIn = 0;
		#1 carryIn = 1;
		#1 y = 7; carryIn = 0;
		#1 carryIn = 1;
		#1 y = 8; carryIn = 0;
		#1 carryIn = 1;
		#1 y = 9; carryIn = 0;
		#1 carryIn = 1;
		#1 y = 10; carryIn = 0;
		#1 carryIn = 1;
		#1 y = 11; carryIn = 0;
		#1 carryIn = 1;
		#1 y = 12; carryIn = 0;
		#1 carryIn = 1;
		#1 y = 13; carryIn = 0;
		#1 carryIn = 1;
		#1 y = 14; carryIn = 0;
		#1 carryIn = 1;
		#1 y = 15; carryIn = 0;
		#1 carryIn = 1;
	end
endmodule //principal