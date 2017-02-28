//---------------------------------------
//Exemplo0032 - soma/diferença 4bits(zero)
//Nome: Rafael Guimaraes de Sousa
//Matrícula: 451607
//---------------------------------------

`include "FullAdder.v"

module adder_subtractor(output s, input [3:0]a,
			input [3:0]b, input carryIn);
	wire [3:0]aux;
	wire [3:0]s0;
	xor xor1(aux[0],b[0],carryIn);
	xor xor2(aux[1],b[1],carryIn);
	xor xor3(aux[2],b[2],carryIn);
	xor xor4(aux[3],b[3],carryIn);
	fullAdder4bits fa1(s0,a,aux,carryIn);
	zeroDetector z1(s,s0);
endmodule //f4

module zeroDetector(output s,input[3:0]x);
	nor nor1(s,x[0],x[1],x[2],x[3]);
endmodule //fim zeroDetector

module principal;
	reg [3:0]x,y;
	reg carryIn;
	wire s;
	
	adder_subtractor as1(s,x,y,carryIn);
	
	initial begin
		x = 4'b0000;
		y = 4'b0000;
		carryIn = 0;
		$display("Exemplo0032 - Rafael Guimaraes de Sousa - 451607");
		$display("Adder/Subtractor 4bits(zero)");
		$display("s: (0)dif. zero, (1)igual a zero");
		$display("CarryIn: (0)adder,(1)subtractor");
		$display("cIn \tx +/- y = s");
		$monitor("%b \t%4b +/- %4b = %b",carryIn,x,y,s);
		
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