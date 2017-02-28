// -------------------------
// Exemplo0031 - MenorMaior
// Nome: Fernando dos Santos Silva
// Matricula: 414506// -------------------------
// -------------------------
// f4_gate
// -------------------------
 
	module f4 (output [2:0]saida, input [1:0]entr01, input [1:0]entr02);
	input [0:0]saidaFinal;
	input [2:0] saida_not;
		//---NOT
		not NOT1(saida_not[0],entr02[0]);
		//---NOT
		not NOT2(saida_not[1],entr02[1]);
		//---NOT
		not NOT3(saida_not[2],entr02[1]);
		//---AND
		and AND1(saida[0], saida_not[0], entr01[0]);
		//---AND
		and AND2(saida[1], entr01[1], saida_not[1]);
		//---AND
		and AND3(saida[2],entr01[1],saida_not[1]);
		//---OR
	   or OR4(saidaFinal[0], saida[0], saida[1],saida[2]); 
	
	endmodule //f4

// ------------------------- 
// -- test f4
// -------------------------
	 module test_f4;
// ------------------------- definir dados
		reg  [1:0] x;
		reg  [1:0] y;
		wire [2:0] z;
		
		f4 modulo (z, x, y);
// ------------------------- parte principal
	 initial begin
		$display("Exemplo0031 - Fernando dos Santos Silva - 414506");
		$display("Test LU's module \n");
		#1 x = 2'b00;	y = 2'b10;
		$monitor("%1b %1b  %1b",x ,y,z[2]);
		#1 x = 2'b10;	y = 2'b01;
		#1 x = 2'b11;	y = 2'b01;
		#1 x = 2'b01;   y = 2'b11;
	 end
	endmodule // test_f4