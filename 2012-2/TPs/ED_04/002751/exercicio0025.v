  // ------------------------- 
// Exemplo0025 - complemento de 2 
// Nome: Milton costa teles da silva
// Matricula: 002751 
// -------------------------  
// ------------------------- 
`include "FullAdder.v"

module complementoDe2(output [2:0]s, input [2:0]a);
	reg carryOut;
	wire [2:0]w;
	not not1(w[0],a[0]);
	not not2(w[1],a[1]);
	not not3(w[2],a[2]);
	fullAdder3bits fa1(s,w,0,1);
endmodule //complementoDe2

module principal;

	reg [2:0]x;
	wire [2:0]s;
	complementoDe2 c2(s,x);
	initial begin
	   x = 0;
      $display("Exemplo0022 -  Milton costa teles da silva - 002751"); 
		$display("Test ALU's complemento de 2");
		$display("complemento de 2 = s");
		$monitor("\t %3b = %3b",x,s);
		#1 x = 3'b001;
		#1 x = 3'b010;
		#1 x = 3'b011;
		#1 x = 3'b100;
		#1 x = 3'b101;
		#1 x = 3'b110;
		#1 x = 3'b111;
			end

endmodule //principal