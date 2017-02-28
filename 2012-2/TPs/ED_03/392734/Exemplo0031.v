// ---------------------------------------
// Exemplo0031 - F4
// Nome: João Henrique Mendes de Oliveira
// Matricula: 392734
// ---------------------------------------
// -------------------------
// f4_gate
// -------------------------
 
module f4 (output [7:0]saida, input [3:0]entr01, input [3:0]entr02);
	//---AND
	and AND1(saida[0], entr01[0], entr02[0]);
	and AND2(saida[1], entr01[1], entr02[1]);
	and AND3(saida[2], entr01[2], entr02[2]);
	and AND4(saida[3], entr01[3], entr02[3]);
	//---OR
	or OR1(saida[7], entr01[3], entr02[3]);
	or OR2(saida[6], entr01[2], entr02[2]);
	or OR3(saida[5], entr01[1], entr02[1]);
	or OR4(saida[4], entr01[0], entr02[0]);
endmodule //--f4

// ------------------------- 
// -- test f4
// -------------------------
module test_f4;

	reg  [3:0] x;
	reg  [3:0] y;
	wire [7:0] z;
		
	f4 modulo (z, x, y);

	initial begin:main
		$display("Exemplo0031 - João Henrique - 392734");
		$display("Test LU's module \n");
		#1 x = 4'b0011;	y = 4'b0101;
		$monitor("AND: %4b & %4b = %4b \n OR: %3b | %3b = %4b \n", x, y, z[3:0], x, y, z[7:4]);
		#1 x = 4'b0000;	y = 4'b1111;
		#1 x = 4'b1010;	y = 4'b0101;
	 end //--main
endmodule //--test_f4