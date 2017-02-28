// Exemplo-0033 - incremento de 1 (inc) 
// Nome: Milton costa teles da silva
// Matricula: 002751 
// -------------------------  
// ------------------------- 
`include "FullAdder.v"

module incremento1(output [2:0]s, input [2:0]a);
	fullAdder3bits fa1(s,a,3'b001,0);

endmodule //incremento1

module principal;

	reg [2:0]x;
	wire [2:0]s;
	incremento1 i1(s,x);
	
	initial begin
	   x = 0;
      $display("Exemplo0022 -  Milton costa teles da silva - 002751"); 
		$display("Test ALU's complemento de 2");
		$display("incremento1 = s");
		$display("x + 0001 = s");
		$monitor("%3b  + %3b = %3b",x,3'b001,s);
		#1 x = 3'b001;
		#1 x = 3'b010;
		#1 x = 3'b011;
		#1 x = 3'b100;
		#1 x = 3'b101;
		#1 x = 3'b110;
		#1 x = 3'b111;
			end

endmodule //principal