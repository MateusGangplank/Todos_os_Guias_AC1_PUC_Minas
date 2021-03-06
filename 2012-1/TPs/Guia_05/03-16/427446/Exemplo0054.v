//---------------------------------------
//Exemplo0054 - decremento de 1
//Nome: Mateus Guilherme do Carmo Cruz
//Matrícula: 427446
//---------------------------------------

`include "FullAdder.v"

module decrement(output [3:0]s, input [3:0]a);
	fullAdder4bits fa1(s,a,4'b1111,0);
endmodule //f4

module principal;
	reg [3:0]x;
	wire [3:0]s;
	
	decrement d1(s,x);
	
	initial begin
		x = 4'b0000;
		$display("Exemplo0054 - Mateus Guilherme do Carmo Cruz - 427446");
		$display("decremento de 1 para 4bits");
		$display("x -(0001) = s");
		$monitor("%4b - %4b = %4b",x,4'b0001,s);
		#1 x = 1;
		#1 x = 2;
		#1 x = 3;
		#1 x = 4;
		#1 x = 5;
		#1 x = 6;
		#1 x = 7;
		#1 x = 8;
		#1 x = 9;
		#1 x = 10;
		#1 x = 11;
		#1 x = 12;
		#1 x = 13;
		#1 x = 14;
		#1 x = 15;
	end
endmodule //principal