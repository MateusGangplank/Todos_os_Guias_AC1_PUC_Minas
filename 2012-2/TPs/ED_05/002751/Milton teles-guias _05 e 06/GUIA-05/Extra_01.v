// Extra_01 - decremento de 1 (dec) 
// Nome: Milton costa teles da silva
// Matricula: 002751 
// -------------------------  
// ------------------------- 
`include "FullAdder.v"

module decremento1(output [2:0]s, input [2:0]a);
	fullAdder3bits fa1(s,a,3'b111,0);
endmodule //decremento1

module principal;

	reg [2:0]x;
	wire [2:0]s;
	decremento1 d1(s,x);
	
	initial begin
	   x = 0;
      $display("Extra_01 -  Milton costa teles da silva - 002751"); 
		$display("Test ALU's decremento de 1 (dec)");
		$display("decremento1 = s");
		$display("x + 0001 = s");
		$monitor("%3b  - %3b = %3b",x,3'b001,s);
		#1 x = 3'b001;
		#1 x = 3'b010;
		#1 x = 3'b011;
		#1 x = 3'b100;
		#1 x = 3'b101;
		#1 x = 3'b110;
		#1 x = 3'b111;
			end

endmodule //principal