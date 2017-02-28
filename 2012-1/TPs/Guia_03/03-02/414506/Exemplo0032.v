// -------------------------
// Exemplo0032 - Selecion�vel
// Nome: Fernando Silva
// Matricula: 414506
// -------------------------
// -------------------------
// selecionavel_gate
// -------------------------
 
	module selecionavel(output [3:0]saida_and, output [3:0]saida_or, output [7:0]saida, output [3:0]s, output [0:0]saida_not, input [3:0]entrada01, input [3:0]entrada02, input [0:0]chave);
	//---AND
		and AND1(saida_and[0], entrada01[0], entrada02[0]);
		and AND2(saida_and[1], entrada01[1], entrada02[1]);
		and AND3(saida_and[2], entrada01[2], entrada02[2]);
		and AND4(saida_and[3], entrada01[3], entrada02[3]);
	//---OR
		or OR1(saida_or[3], entrada01[3], entrada02[3]);
		or OR2(saida_or[2], entrada01[2], entrada02[2]);
		or OR3(saida_or[1], entrada01[1], entrada02[1]);
		or OR4(saida_or[0], entrada01[0], entrada02[0]); 
	//---AND
		and AND5(saida[0], saida_and[0], chave[0]);
		and AND6(saida[1], saida_and[1], chave[0]);
		and AND7(saida[2], saida_and[2], chave[0]);
		and AND8(saida[3], saida_and[3], chave[0]);
	//---NOT	 
		not NOT1(saida_not[0], chave[0]);
	//---AND 
		and AND9(saida[4], saida_or[0], saida_not[0]);
		and AND10(saida[5], saida_or[1], saida_not[0]);
		and AND11(saida[6], saida_or[2], saida_not[0]);
		and AND12(saida[7], saida_or[3], saida_not[0]);
	//---OR 
		or OR5(s[3], saida[3], saida[7]);
		or OR6(s[2], saida[2], saida[6]);
		or OR7(s[1], saida[1], saida[5]);
		or OR8(s[0], saida[0], saida[4]); 
	
	endmodule //selecionavel

// ------------------------- 
// -- test f4
// -------------------------
	 module test_selecionavel;
// ------------------------- definir dados
    reg  [3:0] x;
	 reg  [3:0] y;
	 reg  [0:0] c;
	 
	 wire [3:0] w;
	 wire [3:0] k;
	 wire [7:0] z;
	 wire [3:0] m;
	 wire [0:0] g;

    selecionavel modulo (w, k, z, m, g, x, y, c);

// ------------------------- parte principal
	 initial begin
		$display("Exemplo0032 - Fernando Silva - 414506");
		$display("Test LU's module:\n");
      #1 x = 4'b0101; y = 4'b1010; c = 0;
		$monitor("\tChave = %1b\n x = %4b  y = %4b  Sa�da ==> %4b\n", c, x, y, m);
		#1 x = 4'b0101; y = 4'b1010; c = 1;		
		#1 x = 4'b1111; y = 4'b0000; c = 0;
		#1 x = 4'b1111; y = 4'b0000; c = 1;		
		#1 x = 4'b1001; y = 4'b1000; c = 0;
		#1 x = 4'b1001; y = 4'b1000; c = 1;
	 end
	endmodule // test_f4