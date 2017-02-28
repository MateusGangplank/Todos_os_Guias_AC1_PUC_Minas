`include "FullAdder.v"

// ------------------------------------
// Exemplo0044 - COMPLEMENTO DE 2
// Nome:Mateus Guilherme do Carmo Cruz
// Matricula: 427446
// ------------------------------------


module complemento(output [3:0]s, input [3:0]x);
	reg carryOut;
	wire [3:0]aux1;
	not not1(aux1[0],x[0]);
	not not2(aux1[1],x[1]);
	not not3(aux1[2],x[2]);
	not not4(aux1[3],x[3]);
	fullAdder4bits fa1(s,aux1,4'b0000,1'b1);
endmodule //complemento

module principal;

	reg [3:0]a;
	wire [3:0]s;
	complemento c2(s,a);
	initial begin
		$display("Exemplo0044 - Mateus Guilherme do Carmo Cruz - 427446"); 
		$display("Test LU's complemento de 2");
		a = 0;
		$display("c2(a) = s");
		$monitor("c2(%4b) = %4b",a,s);
		#1 a = 1;
		#1 a = 2;
		#1 a = 3;
		#1 a = 4;
		#1 a = 5;
		#1 a = 6;
		#1 a = 7;
		#1 a = 8;
		#1 a = 9;
		#1 a = 10;
		#1 a = 11;
		#1 a = 12;
		#1 a = 13;
		#1 a = 14;
		#1 a = 15;
	end

endmodule //principal