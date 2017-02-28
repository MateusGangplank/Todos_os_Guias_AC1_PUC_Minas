// -------------------------
// Exemplo0031 - comparador
// Nome: Fernando dos Santos Silva
// Matricula: 414506// -------------------------
// -------------------------
// f4_gate
// -------------------------
 
	module f4 (output [2:0]saida, input [0:0]entr01, input [0:0]entr02);
	input [2:0] saida_not;
		//---NOT
		not NOT1(saida_not[0],entr01[0]);
		//---NOT
		not NOT2(saida_not[1],entr02[0]);
		//---AND
		and AND1(saida[0], saida_not[0], entr02[0]);
		//---AND
		and AND2(saida[1], entr01[0], saida_not[1]);
		//---OR
	   or OR4(saida[2], saida[0], saida[1]); 
	
	endmodule //f4

// ------------------------- 
// -- test f4
// -------------------------
	 module test_f4;
// ------------------------- definir dados
		reg  [0:0] x;
		reg  [0:0] y;
		wire [2:0] z;
		
		f4 modulo (z, x, y);
// ------------------------- parte principal
	 initial begin
		$display("Exemplo0031 - Fernando dos Santos Silva - 414506");
		$display("Test LU's module \n");
		#1 x = 1'b0;	y = 1'b0;
		$monitor("%1b %1b  %1b",x ,y,z[2]);
		#1 x = 1'b0;	y = 1'b1;
		#1 x = 1'b1;	y = 1'b0;
		#1 x = 1'b1;   y = 1'b1;
	 end
	endmodule // test_f4