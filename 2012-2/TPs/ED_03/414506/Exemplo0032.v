// -------------------------
// Exemplo0032 - Selecionável
// Nome: Fernando dos Santos Silva
// Matricula: 414506
// -------------------------
// -------------------------
// selecionavel_gate
// -------------------------
 
	module selecionavel(output [0:0]saida_and, output [0:0]saida_or, output [1:0]saida, output [0:0]s, output [0:0]saida_not, input [0:0]entrada01, input [0:0]entrada02, input [0:0]chave);
	//---AND
		and AND1(saida_and[0], entrada01[0], entrada02[0]);
			//---OR
		or OR1(saida_or[0], entrada01[0], entrada02[0]);
			//---AND
		and AND5(saida[0], saida_and[0], chave[0]);
			//---NOT	 
		not NOT1(saida_not[0], chave[0]);
	//---AND 
		and AND9(saida[1], saida_or[0], saida_not[0]);
			//---OR 
		or OR5(s[0], saida[0], saida[1]);
			
	endmodule //selecionavel

// ------------------------- 
// -- test f4
// -------------------------
	 module test_selecionavel;
// ------------------------- definir dados
    reg  [0:0] x;
	 reg  [0:0] y;
	 reg  [0:0] c;
	 
	 wire [0:0] w;
	 wire [0:0] k;
	 wire [1:0] z;
	 wire [0:0] m;
	 wire [0:0] g;

    selecionavel modulo (w, k, z, m, g, x, y, c);

// ------------------------- parte principal
	 initial begin
		$display("Exemplo0032 - Fernando dos Santos Silva - 414506");
		$display("Test LU's module:\n");
      #1 x = 1'b0; y = 1'b1; c = 0;
		$monitor("\tChave = %1b\n x = %1b  y = %1b  Saída ==> %1b\n", c, x, y, m);
		#1 x = 1'b0; y = 1'b1; c = 1;		
		#1 x = 1'b1; y = 1'b0; c = 0;
		#1 x = 1'b0; y = 1'b0; c = 1;		
			 end
	endmodule // test_f4