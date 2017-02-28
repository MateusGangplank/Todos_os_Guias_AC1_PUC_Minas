// -------------------------
// Exemplo0034 - Selecionável
// Nome: João Henrique Mendes de Oliveira
// Matricula: 392734
// -------------------------
// -------------------------
// selecionavelecionavel_gate
// -------------------------

	module selecionavel (output [3:0]saida_xor, output [3:0]saida_or, output [3:0]saida_xnor, output [3:0]saida_nor, output [0:0]saida_not, output [7:0]s1, 
								output [7:0]s2, output [3:0]saida0, output [3:0]saida1, input [3:0]entrada1, input [3:0]entrada2, input [0:0]chave);
	//---XOR				
		xor XOR1(saida_xor[0], entrada1[0], entrada2[0]);
		xor XOR2(saida_xor[1], entrada1[1], entrada2[1]);
		xor XOR3(saida_xor[2], entrada1[2], entrada2[2]);
		xor XOR4(saida_xor[3], entrada1[3], entrada2[3]);
	//---OR	
		or OR1(saida_or[0], entrada1[0], entrada2[0]);
		or OR2(saida_or[1], entrada1[1], entrada2[1]);
		or OR3(saida_or[2], entrada1[2], entrada2[2]);
		or OR4(saida_or[3], entrada1[3], entrada2[3]); 
	//---OR		 
		xor XNOR1(saida_xnor[0], entrada1[0], entrada2[0]);
		xor XNOR2(saida_xnor[1], entrada1[1], entrada2[1]);
		xor XNOR3(saida_xnor[2], entrada1[2], entrada2[2]);
		xor XNOR4(saida_xnor[3], entrada1[3], entrada2[3]);
	//---OR	
		or NOR1(saida_nor[0], entrada1[0], entrada2[0]);
		or NOR2(saida_nor[1], entrada1[1], entrada2[1]);
		or NOR3(saida_nor[2], entrada1[2], entrada2[2]);
		or NOR4(saida_nor[3], entrada1[3], entrada2[3]);
	//---NOT		 
		not NOT1(saida_not[0], chave[0]); 
	//---AND		 
		and AND1(s1[0], saida_xor[0], chave[0]);
		and AND2(s1[1], saida_xor[1], chave[0]);
		and AND3(s1[2], saida_xor[2], chave[0]);
		and AND4(s1[3], saida_xor[3], chave[0]);
	//---AND		
		and AND5(s1[4], saida_or[0], saida_not[0]);
		and AND6(s1[5], saida_or[1], saida_not[0]);
		and AND7(s1[6], saida_or[2], saida_not[0]);
		and AND8(s1[7], saida_or[3], saida_not[0]);
	//---AND			 
		and AND9(s2[0], saida_xnor[0], chave[0]);
		and AND10(s2[1], saida_xnor[1], chave[0]);
		and AND11(s2[2], saida_xnor[2], chave[0]);
		and AND12(s2[3], saida_xnor[3], chave[0]);
	//---AND		
		and AND13(s2[4], saida_nor[0], saida_not[0]);
		and AND14(s2[5], saida_nor[1], saida_not[0]);
		and AND15(s2[6], saida_nor[2], saida_not[0]);
		and AND16(s2[7], saida_nor[3], saida_not[0]);
	//---OR		 
		or OR1(saida0[0], s1[0], s1[4]);
		or OR2(saida0[1], s1[1], s1[5]);
		or OR3(saida0[2], s1[2], s1[6]);
		or OR4(saida0[3], s1[3], s1[7]); 
	//---OR		 
		or OR5(saida1[0], s2[1], s2[4]);
		or OR6(saida1[1], s2[2], s2[5]);
		or OR7(saida1[2], s2[3], s2[6]);
		or OR8(saida1[3], s2[4], s2[7]);

	endmodule //selecionavel

// ------------------------- 
// -- test selecionavel
// -------------------------
	 module test_selecionavel; 
// ------------------------- definir dados 
		reg  [3:0] x;
		reg  [3:0] y;
		reg  [0:0] c;
			 
		wire [3:0] w;
		wire [3:0] k;
		wire [3:0] t;
		wire [3:0] z;
		wire [0:0] a;
		wire [7:0] h;
		wire [7:0] p;
		wire [3:0] s0;
		wire [3:0] s1;
		
		selecionavel modulo (w, k, t, z, a, h, p, s0, s1 ,x ,y , c);
	  
// ------------------------- parte principal 
	 initial begin
		$display("Exemplo0034 - João Henrique Mendes de Oliveira - 392734");
      $display("Test LU's module:\n");
      #1 x = 4'b0101; y = 4'b1010; c = 0;
		$monitor("\tChave = %1b\n x = %4b  y = %4b  Resultado = %4b  Saída ==> %4b\n", c, x, y, s0, s1);
		#1 x = 4'b0101; y = 4'b1010; c = 1;
		
		#1 x = 4'b1111; y = 4'b0000; c = 0;
		#1 x = 4'b1111; y = 4'b0000; c = 1;
		
		#1 x = 4'b1001; y = 4'b1000; c = 0;
		#1 x = 4'b1001; y = 4'b1000; c = 1;
	 end
	endmodule // test_selecionavel