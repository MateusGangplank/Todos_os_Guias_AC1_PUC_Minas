// -------------------------
// Exemplo0033 - Selecionável
// Nome: Fernando dos Santos Silva
// Matricula: 414506
// -------------------------
// -------------------------
// selecionavel_gate
// -------------------------
 
	module selecionavel (output [0:0]saida_and, output [0:0]saida_or, output [0:0]saida_nand, output [0:0]saida_nor, output [0:0]saida_not, output [1:0]s1, 
								output [1:0]s2, output [0:0]saida0, output [0:0]saida1, input [0:0]entrada1, input [0:0]entrada2, input [0:0]chave);
	//---AND			
		and AND_1(saida_and[0], entrada1[0], entrada2[0]);
			//---OR	
		or OR_1(saida_or[0], entrada1[0], entrada2[0]);
			//---NAND		 
		nand NAND1(saida_nand[0], entrada1[0], entrada2[0]);
			//---NOR	
		nor NOR1(saida_nor[0], entrada1[0], entrada2[0]);
		
	//---NOT		 
		not NOT1(saida_not[0], chave[0]);
	//---AND		 
		and AND1(s1[0], saida_and[0], saida_not[0]);
			//---AND		
		and AND5(s1[1], saida_or[0], saida_not[0]);
			//---AND		 
		and AND9(s2[0], saida_nand[0], chave[0]);
			//---AND		
		and AND13(s2[1], saida_nor[0], chave[0]);
			//---OR		 
		or OR1(saida0[0], s1[0], s2[0]);
		
	//---OR		 
		or OR5(saida1[0], s1[1], s2[1]);
				
	endmodule //selecionavel

// ------------------------- 
// -- test selecionavel
// -------------------------
	module test_selecionavel; 
// ------------------------- definir dados 
		reg  [0:0] x;
		reg  [0:0] y;
		reg  [0:0] c;
			 
		wire [0:0] w;
		wire [0:0] k;
		wire [0:0] r;
		wire [0:0] s;
		wire [0:0] a;
		wire [1:0] h;
		wire [1:0] p;
		wire [0:0] s0;
		wire [0:0] s1;
		
		selecionavel modulo (w, k, r, s, a, h, p, s0, s1, x, y, c);

// ------------------------- parte principal
	 initial begin
		$display("Exemplo0033 - Fernando dos Santos Silva - 414506");
      $display("Test LU's module:\n");
      #1 x = 1'b0; y = 1'b0; c = 0;
		$monitor("\tChave = %1b\n x = %1b  y = %1b  Resultado = %1b  Saída ==> %1b\n", c, x, y, s0, s1);
		#1 x = 1'b0; y = 1'b1; c = 1;		
		#1 x = 1'b1; y = 1'b0; c = 0;
		#1 x = 1'b1; y = 1'b0; c = 1;
			 end
	endmodule // test_selecionavel